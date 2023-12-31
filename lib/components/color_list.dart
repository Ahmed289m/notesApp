import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/components/color_item.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit_cubit.dart';

class ColorItemList extends StatefulWidget {
  const ColorItemList({super.key});

  @override
  State<ColorItemList> createState() => _ColorItemListState();
}

class _ColorItemListState extends State<ColorItemList> {
  int? currentColorIndex = 0;
  
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
              BlocProvider.of<AddNoteCubitCubit>(context).color=kcolors[index];
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
