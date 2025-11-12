import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CONTATO',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up_rounded,
                      size: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 500,
            color: Color(0xff0C0C0E),
          )
        ],
      ),
    );
  }
}
