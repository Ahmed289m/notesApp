import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/views/edit_note_view.dart';

class NoteCont extends StatelessWidget {
  const NoteCont({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const EditNoteView();
        }));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xfffdcb7a),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                horizontalTitleGap: 50,
                title: Text(
                  'Flutter Tips',
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(color: Colors.black, fontSize: 28)),
                ),
                subtitle: Text(
                  'Build Your Career with Ahmed Salama',
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      color: Color.fromARGB(94, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ),
                trailing: Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'May 21 ,2022',
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    color: const Color.fromARGB(151, 0, 0, 0),
                    fontSize: 18,
                  )),
                ),
              ),
            ],
          )),
    );
  }
}
