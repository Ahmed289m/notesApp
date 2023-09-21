import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/components/Custom_Text_Fields.dart';
import 'package:notesapp/components/Edit_color_list.dart';
import 'package:notesapp/components/appBar.dart';
import 'package:notesapp/components/color_list.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notesapp/models/note_model.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppbar(
          title: 'Edit Note',
          icon: Icons.done,
          onTap: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.content = content ?? widget.note.content;
            Navigator.pop(context);
            BlocProvider.of<NotesCubitCubit>(context).getNotes();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            CustomTextFiled(
              onChange: (value) {
                title = value;
              },
              hint: widget.note.title,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFiled(
              onChange: (value) {
                content = value;
              },
              hint: widget.note.content,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            ),
             EditColorList(note: widget.note,),
          ],
        ),
      ),
    );
  }
}
