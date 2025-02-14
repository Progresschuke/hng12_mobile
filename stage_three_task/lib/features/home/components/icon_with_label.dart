import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_three_task/styles/app_colors.dart';
import 'package:stage_three_task/utils/extensions.dart';

import '../../../providers/theme_provider.dart';

class IconWithLabel extends StatelessWidget {
  const IconWithLabel({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final isDarkTheme = themeProvider.isDarkTheme;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDarkTheme ? AppColors.gray200 : AppColors.gray900,
            ),
            const SizedBox(width: 10),
            text.text.h2.copyWith(style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      );
    });
  }
}
