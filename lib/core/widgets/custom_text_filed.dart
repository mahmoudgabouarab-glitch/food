import 'package:flutter/material.dart';
import 'package:food/core/utils/app_color.dart';

class CustomTextFormFiled extends StatefulWidget {
  final String? hint;
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextStyle? labelStyle;
  final Color? fillcolor;
  final TextStyle? textstyle;
  final Function(String)? onchange;
  final TextInputType? keybordtype;
  const CustomTextFormFiled({
    super.key,
    this.hint,
    this.suffix,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.labelText,
    this.labelStyle,
    this.fillcolor,
    this.textstyle,
    this.onchange,
    this.keybordtype,
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  late bool _obscure;
  @override
  void initState() {
    _obscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keybordtype,
      onChanged: widget.onchange,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              )
            : widget.suffix,
        fillColor: widget.fillcolor ?? const Color(0xffEDEDED),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primary),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEDEDED)),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffFF4C5E)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      obscureText: _obscure,
      style: widget.textstyle ?? const TextStyle(color: Colors.black),
    );
  }
}
