import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key, this.onSaved,this.contentPadding,required this.hint});
  final void Function(String?)? onSaved;
  final EdgeInsetsGeometry? contentPadding;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
          onSaved: onSaved,
          validator: (value){
            if(value?.isEmpty?? true)
            {
              return 'The Field Is Required';
            }
            else {
              return null;
            }
          },
          decoration:  InputDecoration(
              hintText: hint,
              contentPadding: contentPadding,
              hintStyle: const TextStyle(color: Color.fromARGB(255, 119, 212, 202)),
              focusedBorder:const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        );
  }
}
