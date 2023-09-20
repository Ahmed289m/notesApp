part of 'notes_cubit_cubit.dart';

@immutable
class NotesCubitState {}

class NotesStateInitial extends NotesCubitState {}

class NotesStateSuccess extends NotesCubitState {
  final List<NoteModel> notes;

  NotesStateSuccess({required this.notes});
}

class NotesStateFailure extends NotesCubitState {
  final String error;

  NotesStateFailure(this.error);

}
