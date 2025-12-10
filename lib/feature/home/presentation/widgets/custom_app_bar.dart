import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 24.0,
        right: 24.0,
        bottom: 24.0,
      ),
      child: Row(
        children: [
          Text(
            'Islamic',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
        ],
      ),
    );
  }
}
