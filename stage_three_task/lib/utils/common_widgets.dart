import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class InputFormBox extends StatelessWidget {
  const InputFormBox(
      {super.key,
      this.hintText,
      this.textInputType,
      this.minLines,
      this.maxLines,
      this.helperText,
      this.fillColor,
      this.suffixIcon,
      this.prefixIcon,
      this.width,
      this.showBorder = true,
      this.obscureText = false,
      this.focusNode,
      this.textEditingController,
      this.autovalidateMode,
      this.hintStyleColor,
      this.validator});

  final String? hintText;
  final TextInputType? textInputType;
  final int? minLines;
  final int? maxLines;
  final Color? fillColor;
  final Color? hintStyleColor;
  final String? helperText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool showBorder;
  final bool obscureText;
  final double? width;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isDarTheme = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: width ?? 100 * size.width / 100,
      child: TextFormField(
        focusNode: focusNode,
        controller: textEditingController,
        style:
            const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        minLines: minLines,
        maxLines: maxLines ?? 1,
        autovalidateMode: autovalidateMode,
        keyboardType: textInputType ?? TextInputType.name,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: isDarTheme ? AppColors.gray200 : AppColors.gray900,
          prefixStyle:
              TextStyle(color: isDarTheme ? Colors.white : Colors.black),
          suffixIcon: suffixIcon,
          helperText: helperText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: hintStyleColor,
          ),
          filled: true,
          fillColor: fillColor ?? Colors.white,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 12),
        ),
      ),
    );
  }
}
