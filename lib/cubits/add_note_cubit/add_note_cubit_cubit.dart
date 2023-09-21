import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/models/note_model.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteInitialState());
  Color? color = const Color(0xff79AC78);
  addNote(NoteModel note) async {
    note.color=color!.value;
    emit(AddNoteLoadingState());
    try {
      var notes = Hive.box<NoteModel>('notes');
      await notes.add(note);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
