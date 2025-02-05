import 'package:flutter/material.dart';
import 'package:stage_one_task/constants/app_colors.dart';

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
      this.width,
      this.showBorder = true,
      this.obscureText = false,
      this.focusNode,
      this.textEditingController,
      this.autovalidateMode,
      this.validator});

  final String? hintText;
  final TextInputType? textInputType;
  final int? minLines;
  final int? maxLines;
  final Color? fillColor;
  final String? helperText;
  final Widget? suffixIcon;
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
    return SizedBox(
      width: width ?? 100 * size.width / 100,
      // height: 60,
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
          suffixIcon: suffixIcon,
          helperText: helperText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: showBorder
                ? const BorderSide(color: AppColors.primary, width: 1.0)
                : BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
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

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 40,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.baseWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
