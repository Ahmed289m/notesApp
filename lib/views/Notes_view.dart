import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/components/appBar.dart';
import 'package:notesapp/components/bottomSheetContent.dart';
import 'package:notesapp/components/noteContainer.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit_cubit.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubitCubit(),
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 15, mainAxisExtent: 220),
              itemBuilder: (context, index) {
                return const NoteCont();
              }),
        ),
      ),
    );
  }
}
