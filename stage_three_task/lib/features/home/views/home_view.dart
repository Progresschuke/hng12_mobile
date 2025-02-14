import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_three_task/providers/theme_provider.dart';
import 'package:stage_three_task/utils/common_widgets.dart';
import 'package:stage_three_task/utils/extensions.dart';

import '../../../styles/app_colors.dart';
import '../components/country_list_widget.dart';
import '../components/icon_with_label.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final isDarkTheme = themeProvider.isDarkTheme;
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        'Explore'.text.h1.copyWith(
                            style: Theme.of(context).textTheme.displayLarge),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.red),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        themeProvider.toggleTheme();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDarkTheme
                                ? AppColors.gray400.withOpacity(0.2)
                                : AppColors.gray25),
                        child: Icon(isDarkTheme
                            ? Icons.bedtime_outlined
                            : Icons.wb_sunny_outlined),
                      )),
                ],
              ),
              const SizedBox(height: 25),
              InputFormBox(
                fillColor: isDarkTheme
                    ? AppColors.gray400.withOpacity(0.2)
                    : AppColors.gray100,
                hintText: 'Search Country',
                hintStyleColor:
                    isDarkTheme ? AppColors.gray200 : AppColors.gray900,
                prefixIcon: Icon(
                  Icons.search,
                  color: isDarkTheme ? AppColors.gray200 : AppColors.gray900,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconWithLabel(
                    text: 'EN',
                    icon: Icons.language_outlined,
                  ),
                  IconWithLabel(
                    text: 'Filter',
                    icon: Icons.filter_alt_outlined,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const CountryListWidget(),
            ],
          ),
        ),
      );
    });
  }
}
