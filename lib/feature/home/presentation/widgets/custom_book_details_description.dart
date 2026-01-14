import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBookDescription extends StatelessWidget {
  const CustomBookDescription({super.key, required this.bookDescription});
  final String bookDescription;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description : ',
            style: Styles.textStyle16.copyWith(
              color: Colors.black87,
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(height: 12),
          Text(
            bookDescription,
            style: Styles.textStyle14.copyWith(
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
