import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';
import '../../../styles/app_colors.dart';
import '../../../utils/utils.dart';
import '../provider/home_provider.dart';
import '../views/country_details_view.dart';

class CountryListWidget extends StatefulWidget {
  const CountryListWidget({
    super.key,
  });

  @override
  State<CountryListWidget> createState() => _CountryListWidgetState();
}

class _CountryListWidgetState extends State<CountryListWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).fetchCountries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeProvider>(
        builder: (context, homeProvider, themeProvider, child) {
      final isDarkTheme = themeProvider.isDarkTheme;
      final countries = homeProvider.countryModel ?? [];
      final isLoading = homeProvider.fetchingCountriesStatus;
      print(homeProvider.fetchingCountriesStatus);
      return isLoading == RequestStatus.loading
          ? Container(
              alignment: Alignment.center,
              height: 200,
              child: const CircularProgressIndicator())
          : isLoading == RequestStatus.failed
              ? Container(
                  alignment: Alignment.center,
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Check your internet connection',
                          style: TextStyle(
                              color: isDarkTheme
                                  ? AppColors.gray100
                                  : AppColors.black)),
                      ElevatedButton(
                        onPressed: () {
                          homeProvider.fetchCountries();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkTheme
                              ? AppColors.gray100
                              : AppColors.darkBg,
                          foregroundColor: isDarkTheme
                              ? AppColors.darkBg
                              : AppColors.gray100,
                        ),
                        child: Text(
                          'Retry',
                          style: TextStyle(
                            color: isDarkTheme
                                ? AppColors.darkBg
                                : AppColors.gray100,
                          ),
                        ),
                      )
                    ],
                  ))
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: countries.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final country = countries[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return CountryDetailsView(country: country);
                            },
                          ));
                        },
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(country.flags?.png ??
                                    'https://via.placeholder.com/150'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            country.name?.common ?? '',
                            style: TextStyle(
                                color: isDarkTheme
                                    ? AppColors.gray100
                                    : AppColors.black),
                          ),
                          subtitle: Text(country.capital?[0] ?? '',
                              style: TextStyle(
                                  color: isDarkTheme
                                      ? AppColors.gray400
                                      : AppColors.gray500)),
                        ),
                      );
                    },
                  ),
                );
    });
  }
}
