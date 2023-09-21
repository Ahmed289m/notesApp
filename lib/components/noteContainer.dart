import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/edit_note_view.dart';

class NoteCont extends StatelessWidget {
  const NoteCont({super.key, required this.note});
  final NoteModel note;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  EditNoteView(note: note,);
        }));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(note.color),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                horizontalTitleGap: 50,
                title: Text(
                  note.title,
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(color: Colors.black, fontSize: 28)),
                ),
                subtitle: Text(
                  note.content,
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(94, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    note.delete();
                    BlocProvider.of<NotesCubitCubit>(context).getNotes();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  note.date,
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                    color:  Color.fromARGB(151, 0, 0, 0),
                    fontSize: 18,
                  )),
                ),
              ),
            ],
          )),
    );
  }
}
