import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/components/appBar.dart';
import 'package:notesapp/components/bottomSheetContent.dart';
import 'package:notesapp/components/notes_grid_view.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notesapp/models/note_model.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubitCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const BottomSheetBody();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)));
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const CustomAppbar(
          title: 'Notes',
          icon: Icons.search,
        ),
      ),
      body: BlocBuilder<NotesCubitCubit, NotesCubitState>(
        builder: (context, state) {
          List<NoteModel> notesList =
              BlocProvider.of<NotesCubitCubit>(context).notesList ?? [];
          return const NoteGridView();
        },
      ),
    );
  }
}
