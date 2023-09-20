import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notesapp/components/Custom_Text_Fields.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notesapp/models/note_model.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title;

  String? content;
  bool isLoading = false;

  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextFiled(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFiled(
            hint: 'Content',
            onSaved: (value) {
              content = value;
            },
            contentPadding:
                const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          ),
          SizedBox(
              width: double.infinity,
              child: BlocBuilder<AddNoteCubitCubit, AddNoteCubitState>(
                builder: (context, state) {
                  isLoading = state is AddNoteLoadingState ? true : false;
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 119, 212, 202),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        NoteModel note = NoteModel(
                            title: title!,
                            content: content!,
                            color: Colors.brown.value,
                            date: DateTime.now().toString());
                        BlocProvider.of<AddNoteCubitCubit>(context)
                            .addNote(note);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    child: isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(color: Colors.white,))
                        : Text(
                            'Add',
                            style: GoogleFonts.ubuntu(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
