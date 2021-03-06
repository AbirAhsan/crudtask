import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.onSaved,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ));
  }
}
