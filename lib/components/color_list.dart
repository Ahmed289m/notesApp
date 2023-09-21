import 'package:flutter/material.dart';
import 'package:notesapp/components/color_item.dart';

class ColorItemList extends StatelessWidget {
  const ColorItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ColorItem();
        },
      ),
    );
  }
}