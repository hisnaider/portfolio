import 'dart:math';
import 'dart:ui';

import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/src/features/orbiting_system/entities/transform_position.dart';

class Camera {
  double _speed = 5;
  double _targetSpeed = 5;
  double _startTargetSpeed = 5;
  final double minZoom = 0.5;
  final double maxZoom = 100;
  final double zoomMaxStep = 0.2;

  /// In world position
  final TransformPosition _transformPosition = TransformPosition();
  TransformPosition get transformPosition => _transformPosition;

  Size screenSize = Size.zero;
  Offset screenCenter = Offset.zero;

  /// Zoom values
  double _scale = 1;
  double _targetscale = 1;

  /// Animation values
  Offset _offset = Offset.zero;
  Offset _targetOffset = Offset.zero;

  Offset get offset => _offset;
  double get zoom => _scale;
  double get zoomFactor =>
      ((zoom - minZoom) / (maxZoom - minZoom)).clamp(0.0, 1.0);

  double _elapsed = 0;
  double _duration = 1;

  void update(Size worldSize, double deltaTime) {
    _transformPosition.update(worldSize, _scale, _offset);

    screenSize = worldSize;
    final t = (_elapsed / _duration).clamp(0.0, 1.0);
    if (t >= 1.0) {
      _elapsed = 0;
      _speed = _targetSpeed;
      _startTargetSpeed = _targetSpeed;
    } else if ((_speed - _targetSpeed).abs() > 0.0001) {
      _elapsed += deltaTime;

      _speed = lerpDouble(_startTargetSpeed, _targetSpeed, t)!;
    }

    screenCenter = Offset(worldSize.width / 2, worldSize.height / 2);
    _scale += (_targetscale - _scale) * (_speed * deltaTime);
    _offset += (_targetOffset - _offset) * (_speed * deltaTime);
  }

  void zoomUpdate(double delta) {
    final double safeDelta = delta.clamp(0.9, 1.1);
    final double newScale = (_targetscale * safeDelta).clamp(minZoom, maxZoom);

    if (newScale != _targetscale) {
      final double ratio = newScale / _targetscale;

      // mantém o ponto no centro da tela fixo
      _targetOffset = screenCenter - (screenCenter - _targetOffset) * ratio;

      _targetscale = newScale;
    }
  }

  void move(Offset offSet) {
    _targetOffset += offSet;
  }

  void moveToObject(CelestialBody celestialBody) {
    double screenMin = 0;
    double dxAdjustment = 0;
    double dyAdjustment = 0;

    ///DESKTOP
    screenMin = min(screenSize.width - (kWorkDescContainer + (kWorkDescMargin)),
        screenSize.height);
    dxAdjustment = (kWorkDescContainer + (kWorkDescMargin)) / 2;

    ///MOBILE
    /// screenMin focado no height
    /// dyAdjustment > 0

    final Offset offsetAdjustment = Offset(dxAdjustment, dyAdjustment);
    double zoom = (screenMin * 0.25) / celestialBody.size;
    _targetscale = zoom;
    _targetOffset = (((screenCenter) - offsetAdjustment) -
        worldToScreen(celestialBody.worldPosition) * _targetscale);
  }

  void setAnimation(double targetSpeed, double duration) {
    _elapsed = 0;
    _duration = duration;
    _startTargetSpeed = _targetSpeed;
    _targetSpeed = targetSpeed;
  }

  bool isInCameraView(Offset objectPosition, double size) {
    return (objectPosition.dx + size > _transformPosition.left &&
        objectPosition.dx - size < _transformPosition.right &&
        objectPosition.dy + size > _transformPosition.top &&
        objectPosition.dy - size < _transformPosition.bottom);
  }

  Offset worldToScreen(Offset position) {
    return position + screenCenter;
  }

  Offset screenToWorld(Offset position) {
    return Offset(
      (position.dx - offset.dx) / zoom,
      (position.dy - offset.dy) / zoom,
    );
  }
}
