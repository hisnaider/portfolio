import 'package:flutter/material.dart';

class MeasureSize extends StatefulWidget {
  final Widget child;
  final Function(Size size)? onChange;
  final double maxWidth;

  const MeasureSize({
    super.key,
    required this.child,
    this.onChange,
    required this.maxWidth,
  });

  @override
  State<MeasureSize> createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  @override
  void initState() {
    super.initState();
    _onChange();
  }

  @override
  void didUpdateWidget(covariant MeasureSize oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.maxWidth != widget.maxWidth) {
      _onChange();
    }
  }

  void _onChange() {
    if (widget.onChange != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) widget.onChange!(box.size);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
