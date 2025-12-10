import 'package:flutter/material.dart';

class ListViewBookItem extends StatelessWidget {
  const ListViewBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.25,
        // width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage('assets/images/909326.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
