// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RevealScope extends StatefulWidget {
  const RevealScope({super.key, required this.controller, required this.child});
  final ScrollController controller;
  final Widget child;

  static _RevealScopeState of(BuildContext context) {
    final state = context.findAncestorStateOfType<_RevealScopeState>();
    assert(state != null, 'RevealScope não encontrado na árvore');
    return state!;
  }

  @override
  State<RevealScope> createState() => _RevealScopeState();
}

class _RevealScopeState extends State<RevealScope> {
  final Map<GlobalKey, _RevealSpecif> _listeners = {};

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  void register(GlobalKey key,
      {required VoidCallback onReveal, required double triggerOffsetPx}) {
    _listeners[key] =
        _RevealSpecif(triggerOffsetPx: triggerOffsetPx, listener: onReveal);
  }

  void unregister(GlobalKey key) {
    _listeners.remove(key);
  }

  void _onScroll() {
    final screenHeight = MediaQuery.of(context).size.height;
    final entries = _listeners.entries.toList();
    for (final entry in entries) {
      final ctx = entry.key.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;
      final position = box.localToGlobal(Offset.zero);
      if (position.dy < screenHeight - entry.value.triggerOffsetPx) {
        entry.value.listener();
        _listeners.remove(entry.key);
      }
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class _RevealSpecif {
  final double triggerOffsetPx;
  final VoidCallback listener;
  const _RevealSpecif({
    required this.triggerOffsetPx,
    required this.listener,
  });
}
