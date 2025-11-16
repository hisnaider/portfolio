import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverIntroSectionScroll extends SingleChildRenderObjectWidget {
  const SliverIntroSectionScroll({
    super.key,
    required this.maxHeight,
    required super.child,
  });
  final double maxHeight;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderIntroSectionSliver(maxHeight: maxHeight);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderIntroSectionSliver renderObject) {
    // TODO: implement updateRenderObject
    // super.updateRenderObject(context, renderObject);
    renderObject.maxHeight = maxHeight;
  }
}

class _RenderIntroSectionSliver extends RenderSliverSingleBoxAdapter {
  double _maxHeight;
  _RenderIntroSectionSliver({required double maxHeight})
      : _maxHeight = maxHeight;

  set maxHeight(double value) {
    if (_maxHeight == value) return;
    _maxHeight = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }

    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    final double childExtent = child!.size.height;
    final double scrollOffset = constraints.scrollOffset;

    double paintExtent;
    double layoutExtent;

    if (scrollOffset < _maxHeight) {
      // Fase de animação: o sliver continua ocupando tela,
      // mas vai “encolhendo” conforme o usuário rola
      paintExtent = (childExtent - scrollOffset).clamp(0.0, childExtent);

      // layoutExtent NUNCA pode exceder paintExtent
      layoutExtent = paintExtent;
    } else {
      // Já passou da animação – comportamento normal
      final double remainingScroll = scrollOffset - _maxHeight;

      paintExtent = (childExtent - remainingScroll).clamp(0.0, childExtent);

      layoutExtent = paintExtent;
    }

    geometry = SliverGeometry(
      scrollExtent: childExtent + _maxHeight,
      paintExtent: paintExtent.clamp(0.0, constraints.remainingPaintExtent),
      layoutExtent: layoutExtent.clamp(0.0, constraints.remainingPaintExtent),
      maxPaintExtent: childExtent + _maxHeight,
      hasVisualOverflow: true,
    );

    setChildParentData(child!, constraints, geometry!);
  }
}
