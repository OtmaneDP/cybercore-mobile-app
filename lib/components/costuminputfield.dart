import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CostumInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placholder;
  final Icon? sufixIcon;
  final Icon? prefixIcon;
  final Text? textErorr;
  final Text? label;
  final bool? isPassword;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChange;
  static OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 1,
        color: Colors.black12,
      ));

  const CostumInputField(
      {super.key,
      this.placholder,
      this.sufixIcon,
      this.prefixIcon,
      this.textErorr,
      this.label,
      this.validator,
      this.controller,
      this.onChange(value)?,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword!,
      decoration: InputDecoration(
        label: this.label,
        border: CostumInputField.border,
        enabledBorder: CostumInputField.border,
        focusedBorder: CostumInputField.border,
        prefixIcon: this.prefixIcon == null
            ? null
            : //if sufix not inserted hidde sufix
            Container(
                margin: EdgeInsets.only(right: 10),
                width: 40,
                height: 40,
                padding: EdgeInsets.only(left: 20),
                child: this.prefixIcon,
              ),
        hintText: this.placholder,
        suffixIcon: this.sufixIcon == null
            ? null
            : Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.only(right: 20),
                child: this.sufixIcon,
              ),
        labelStyle: TextStyle(color: Colors.grey),
      ),
      validator: validator,
      onChanged: (value) => onChange!(value),
    );
  }
}
