import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/core/values/my_colors.dart';

class ScrollableContainer extends StatefulWidget {
  const ScrollableContainer({
    super.key,
    required this.scrollValue,
    required this.start,
    required this.end,
    required this.children,
  });
  final ValueNotifier<double> scrollValue;
  final double start;
  final double end;
  final List<Widget> Function(double value) children;

  @override
  State<ScrollableContainer> createState() => _ScrollableContainerState();
}

class _ScrollableContainerState extends State<ScrollableContainer> {
  @override
  void didUpdateWidget(covariant ScrollableContainer oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final value =
        widget.scrollValue.value.normalize(widget.end, min: widget.start);
    final slideUp = value.normalize(1, min: 0);

    return AnimatedBuilder(
        animation: widget.scrollValue,
        builder: (context, child) {
          return LayoutBuilder(builder: (context, constraint) {
            return Transform.translate(
              offset: Offset(
                  0,
                  MediaQuery.of(context).size.height -
                      (constraint.maxHeight * slideUp)),
              child: Container(
                constraints: BoxConstraints(maxHeight: constraint.maxHeight),
                child: ListView(
                  children: List.generate(
                    widget.children(value).length,
                    (index) {
                      return widget.children(value)[index];
                    },
                  ),
                ),
              ),
            );
          });
        });
  }
}

// class ScrollableContainer extends StatefulWidget {
//   const ScrollableContainer(
//       {super.key,
//       required this.scrollValue,
//       required this.start,
//       required this.end,
//       required this.children,
//       required this.activeAnimation});
//   final VoidCallback activeAnimation;
//   final double scrollValue;
//   final double start;
//   final double end;
//   final List<Widget Function(double start, double end, GlobalKey key)> children;

//   @override
//   State<ScrollableContainer> createState() => _ScrollableContainerState();
// }

// class _ScrollableContainerState extends State<ScrollableContainer> {
//   final List<GlobalKey> keyChildren = [];
//   List intervals = [];
//   double maxHeight = 0;
//   late final double diff;

//   @override
//   void initState() {
//     super.initState();
//     diff = widget.end - widget.start;
//     for (int i = 0; i < widget.children.length; i++) {
//       keyChildren.add(GlobalKey());
//     }
//   }

//   void _changeDimension(double newMaxHeight) {
//     maxHeight = newMaxHeight;
//     double start = widget.start;
//     setState(() {
//       intervals = keyChildren.map((h) {
//         final frac = (h.currentContext?.size?.height ?? 0) / maxHeight;
//         final end = start + (widget.end - widget.start) * frac;
//         final current = (start, end);
//         start = end;
//         return current;
//       }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final double newMaxHeight =
//           keyChildren.fold(0, (a, b) => a + b.currentContext!.size!.height);
//       if (maxHeight != newMaxHeight) {
//         _changeDimension(newMaxHeight);
//       }
//     });
//     final value = widget.scrollValue.normalize(widget.end, min: widget.start);
//     final slideUp = value.normalize(1, min: 0);

//     return Transform.translate(
//       offset:
//           Offset(0, MediaQuery.of(context).size.height - (maxHeight * slideUp)),
//       child: Container(
//         constraints: BoxConstraints(maxHeight: maxHeight),
//         child: OverflowBox(
//           alignment: Alignment.topCenter,
//           maxHeight: maxHeight,
//           child: Column(
//             children: List.generate(
//               widget.children.length,
//               (index) {
//                 final (contentStart, contentEnd) =
//                     intervals.isEmpty ? (0, 0) : intervals[index];
//                 return widget.children[index](
//                     contentStart, contentEnd, keyChildren[index]);
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
