import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
   const ColorItem({super.key,required this.isActive, required this.color});
  final bool isActive ;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive? Padding(
      padding:  const EdgeInsets.only(right: 5),
      child:  CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 15,
          backgroundColor: color,
        ),
      ),
    ):  Padding(
      padding:const EdgeInsets.only(right: 5),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: color,
        ),
      ),
    );
  }
}

