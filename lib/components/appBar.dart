import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Notes',
              style: GoogleFonts.ubuntu(
                  textStyle: const TextStyle(
                fontSize: 30,
                letterSpacing: 2.5
              )),
            ),
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:const Color.fromARGB(122, 80, 80, 80) ,
              ),
              child: const Icon( Icons.search_rounded),
            ),
          ],
        );
  }
}