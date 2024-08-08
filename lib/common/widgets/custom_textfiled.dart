import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String? hint;
  int? maxLines;
  CustomTextfield({super.key,this.hint,this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor:const Color(0xffF1FDFF),
        hintText:hint!,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );

  }
}
