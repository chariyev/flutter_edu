import 'package:flutter/material.dart';

class ButtonIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPress;
  final Color color;

  ButtonIconText(
      {required this.icon,
      this.text = '',
      required this.onPress,
      this.color = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: color,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: color, fontSize: 18),
          )
        ],
      ),
    );
  }
}
