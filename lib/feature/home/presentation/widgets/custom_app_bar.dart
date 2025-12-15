import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
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
