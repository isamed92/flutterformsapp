import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool? obscureText;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChange,
      this.validator,
      this.icon,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: colors.primary),
    );
    return TextFormField(
      obscureText: obscureText != null,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        prefixIcon: icon != null ? Icon(icon) : null,
        errorText: errorMessage,
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
      ),
    );
  }
}
