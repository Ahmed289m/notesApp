part of 'add_note_cubit_cubit.dart';

@immutable
sealed class AddNoteCubitState {}

class AddNoteInitialState extends AddNoteCubitState {}

class AddNoteLoadingState extends AddNoteCubitState {}

class AddNoteSuccessState extends AddNoteCubitState {}

class AddNoteFailureState extends AddNoteCubitState {
  final String error;
  AddNoteFailureState(this.error);
}
