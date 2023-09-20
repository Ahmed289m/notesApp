import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesStateInitial());

  getNotes(){
    try {
      var notes = Hive.box<NoteModel>('notes');
      List<NoteModel>notesList =notes.values.toList(); 
      emit(NotesStateSuccess(notes: notesList));
    } catch (e) {
      emit(NotesStateFailure(e.toString()));
    }
  }
}
