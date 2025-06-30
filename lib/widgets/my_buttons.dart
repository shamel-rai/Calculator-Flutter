import 'package:calculator/constants/buttons.dart';
import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const MyButtons({super.key, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: text != "0"
            ? Size(screenWidth * .22, 80)
            : Size(screenWidth * .44, 80),
        backgroundColor: Buttons.topRowButtons.contains(text)
            ? Colors.grey
            : Buttons.operatorButtons.contains(text)
            ? Colors.orangeAccent
            : Colors.grey.shade900,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
