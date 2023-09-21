import 'package:flutter/material.dart';
import 'package:notesapp/components/color_item.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/models/note_model.dart';

class EditColorList extends StatefulWidget {
  const EditColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
  late int currentColorIndex;

  @override
  void initState() {
    super.initState();
    currentColorIndex = kcolors.indexOf(Color(widget.note.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentColorIndex = index;
              widget.note.color = kcolors[index].value;
              setState(() {});
            },
            child: ColorItem(
              color: kcolors[index],
              isActive: currentColorIndex == index,
            ),
          );
        },
      ),
    );
  }
}
