import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesStateInitial());
  List<NoteModel>? notesList;
  getNotes() {
    var notes = Hive.box<NoteModel>('notes');
    notesList = notes.values.toList();
    emit(NotesStateSuccess());
  }
}
