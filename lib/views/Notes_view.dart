import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Notes',
              style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                fontSize: 28,
              )),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:Color.fromARGB(122, 80, 80, 80) ,
              ),
              child: IconButton(icon: Icon(Icons.search_rounded),onPressed: (){},),
            ),
          ],
        ),
      ),
    );
  }
}
