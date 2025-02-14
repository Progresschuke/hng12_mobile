import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_three_task/features/home/model/country_model.dart';

import '../../../providers/theme_provider.dart';
import '../../../styles/app_colors.dart';
import '../components/custom_text_row_widget.dart';

class CountryDetailsView extends StatelessWidget {
  const CountryDetailsView({super.key, required this.country});

  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final isDarkTheme = themeProvider.isDarkTheme;
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(country.name?.common ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: isDarkTheme ? AppColors.gray200 : AppColors.black)),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(country.flags?.png ??
                          'https://via.placeholder.com/150'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextRow(
                    title: 'Population',
                    subtitle: country.population?.toString(),
                    isDarkTheme: isDarkTheme),
                CustomTextRow(
                    title: 'Region',
                    subtitle: country.region?.toString(),
                    isDarkTheme: isDarkTheme),
                CustomTextRow(
                    title: 'Capital',
                    subtitle: country.capital?[0].toString(),
                    isDarkTheme: isDarkTheme),
                CustomTextRow(
                    title: 'Motto',
                    subtitle: country.population?.toString(),
                    isDarkTheme: isDarkTheme),
                const SizedBox(
                  height: 20,
                ),
                CustomTextRow(
                    title: 'Official Language',
                    subtitle: country.languages?.values.first.toString(),
                    isDarkTheme: isDarkTheme),
                CustomTextRow(
                  title: 'Ethnic Group',
                  subtitle: country.demonyms?.eng?.m ?? 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                CustomTextRow(
                  title: 'Religion',
                  subtitle: 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                CustomTextRow(
                  title: 'Government',
                  subtitle: 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(height: 20),
                CustomTextRow(
                  title: 'Independence',
                  subtitle: country.independent == true ? 'Yes' : 'No',
                  isDarkTheme: isDarkTheme,
                ),
                CustomTextRow(
                  title: 'Area',
                  subtitle:
                      country.area != null ? '${country.area} km²' : 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                CustomTextRow(
                  title: 'Currency',
                  subtitle: country.currencies != null &&
                          country.currencies!.isNotEmpty
                      ? country.currencies!.values.first.name ?? 'N/A'
                      : 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                CustomTextRow(
                  title: 'GDP',
                  subtitle: 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(height: 20),
                CustomTextRow(
                  title: 'Timezone',
                  subtitle:
                      country.timezones != null && country.timezones!.isNotEmpty
                          ? country.timezones!.first
                          : 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                CustomTextRow(
                  title: 'Date Format',
                  subtitle: 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                CustomTextRow(
                  title: 'Dialing Code',
                  subtitle: country.idd != null
                      ? '${country.idd!.root ?? ''} ${country.idd!.suffixes?.join(', ') ?? ''}'
                      : 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                CustomTextRow(
                  title: 'Driving Side',
                  subtitle: country.car?.side != null
                      ? sideValues.reverse[country.car!.side] ?? 'N/A'
                      : 'N/A',
                  isDarkTheme: isDarkTheme,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )));
    });
  }
}
