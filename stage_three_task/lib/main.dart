import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_three_task/features/home/views/home_view.dart';
import 'package:stage_three_task/styles/app_theme.dart';

import 'features/home/provider/home_provider.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<ThemeProvider>(context).isDarkTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Styles.appThemeData(isDarkTheme, context),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
