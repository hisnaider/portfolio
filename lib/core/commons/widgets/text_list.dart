import 'package:flutter/material.dart';

class TextList extends StatelessWidget {
  const TextList({
    super.key,
    required this.leadingIcon,
    required this.children,
    this.textStyle,
  });
  final Widget leadingIcon;
  final List<InlineSpan> children;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (InlineSpan i in children)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                width: 20,
                child: leadingIcon,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: RichText(
                  text: TextSpan(
                      style:
                          textStyle ?? Theme.of(context).textTheme.bodyMedium,
                      children: [i]),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
