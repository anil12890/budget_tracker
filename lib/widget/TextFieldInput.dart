import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final isPass;
  final hintText;
  final TextInputType;
  const TextFieldInput(
      {required this.textEditingController,
      required this.hintText,
      required this.TextInputType,
      this.isPass = false});

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
        keyboardType: TextInputType,
        obscureText: isPass,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white60.withOpacity(0.8)),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          contentPadding: const EdgeInsets.all(8),
        ));
  }
}
