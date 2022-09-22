import 'package:flutter/material.dart';

import '../size.dart';

class SettingCards extends StatelessWidget {
  const SettingCards({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final void Function() onTap;
  final Icon icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //   onDoubleTap: onTap,
      onTap: onTap,
      child: SizedBox(
        width: getWidth(350, context),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              icon,
              SizedBox(width: getWidth(20, context)),
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          const Icon(Icons.chevron_right_outlined),
        ]),
      ),
    );
  }
}
