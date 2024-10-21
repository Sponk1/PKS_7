import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const ProfileOption({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 64,
      child: Row(
        children: [
          Icon(icon, size: 32),
          SizedBox(width: 20),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 17,
              height: 24 / 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
