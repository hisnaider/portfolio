import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/views/scroll_section/feature/reveal_widget_feat/reveal_scope.dart';

class RevealItem extends StatefulWidget {
  final Widget child;
  final double triggerOffsetPx;

  const RevealItem({
    super.key,
    required this.child,
    required this.triggerOffsetPx,
  });

  @override
  State<RevealItem> createState() => _RevealItemState();
}

class _RevealItemState extends State<RevealItem>
    with SingleTickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();
  bool _revealed = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    RevealScope.of(context).register(
      _key,
      onReveal: _reveal,
      triggerOffsetPx: widget.triggerOffsetPx,
    );
  }

  void _reveal() {
    if (_revealed) return;
    _revealed = true;
    setState(() {
      _revealed = true;
    });
  }

  @override
  void dispose() {
    RevealScope.of(context).unregister(_key);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
        key: _key, child: Visibility(visible: _revealed, child: widget.child));
  }
}
