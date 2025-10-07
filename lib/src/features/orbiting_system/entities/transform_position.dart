import 'package:flutter/material.dart';

class TransformPosition {
  double x = 0;
  double y = 0;
  double width = 0;
  double height = 0;
  double get left => x;
  double get right => x + width;
  double get top => y;
  double get bottom => y + height;
  Offset get center => Offset((x + right) / 2, (y + bottom) / 2);

  void update(Size objectSize, double scale, Offset cameraOffset,
      {Offset worldPos = Offset.zero}) {
    // mundo → tela
    x = ((worldPos.dx) - cameraOffset.dx) / scale;
    y = ((worldPos.dy) - cameraOffset.dy) / scale;

    // tamanho ajustado pelo zoom
    width = objectSize.width / scale;
    height = objectSize.height / scale;
  }
}


/*

  void update(Size objectSize, double factor, Offset cameraOffset) {
    x = (-cameraOffset.dx) / factor;
    y = (-cameraOffset.dy) / factor;
    width = objectSize.width / factor;
    height = objectSize.height / factor;
  }

*/