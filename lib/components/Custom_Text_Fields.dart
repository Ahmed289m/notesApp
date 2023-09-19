import 'package:flutter/material.dart';

class CustomTextFileds extends StatelessWidget {
  const CustomTextFileds({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: TextStyle(color: Color.fromARGB(255, 119, 212, 202)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 80, horizontal: 10),
              hintText: 'Content',
              hintStyle: TextStyle(color: Color.fromARGB(255, 119, 212, 202)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ),
      ],
    );
  }
}
