import 'package:flutter/material.dart';

class FooterOption extends StatelessWidget {
  final String text;

  const FooterOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w300, // Light
        fontSize: 15,
        color: Color(0xFF939396),
        height: 20 / 15,
      ),
    );
  }
}
