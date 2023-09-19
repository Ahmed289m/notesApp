import 'package:flutter/material.dart';
import 'package:notesapp/components/Custom_Text_Fields.dart';
import 'package:notesapp/components/appBar.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppbar(title: 'Edit Note', icon: Icons.done),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const Padding(
        padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        child:  CustomTextFileds(),
      ),
    );
  }
}
