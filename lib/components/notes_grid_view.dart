import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/components/noteContainer.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notesapp/models/note_model.dart';

class NoteGridView extends StatelessWidget {
  const NoteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
        builder: (context, state) {
      List<NoteModel> notesList =
          BlocProvider.of<NotesCubitCubit>(context).notesList ?? [];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GridView.builder(
            itemCount: notesList.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 15, mainAxisExtent: 220),
            itemBuilder: (context, index) {
              return NoteCont(
                note: notesList[index],
              );
            }),
      );
    });
  }
}
