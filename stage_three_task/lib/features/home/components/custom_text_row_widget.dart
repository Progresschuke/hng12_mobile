import 'package:flutter/material.dart';

import '../../../styles/app_colors.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isDarkTheme,
  });

  final String? title;
  final String? subtitle;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text('${title ?? ''}: ',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isDarkTheme ? AppColors.gray100 : AppColors.gray900)),
          const SizedBox(
            width: 10,
          ),
          Text(subtitle ?? '',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: isDarkTheme ? AppColors.gray100 : AppColors.gray900))
        ],
      ),
    );
  }
}
