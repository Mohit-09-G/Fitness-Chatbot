import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool enabled;
  final Widget? prefix;
  final Widget? suffix;
  final String? hint;

  const CustomTextField({
    super.key,
    this.controller,
    this.enabled = true,
    this.prefix,
    this.suffix,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        disabledBorder: _buildBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffB0B3C7), width: 1),
      borderRadius: BorderRadius.circular(23),
    );
  }
}
