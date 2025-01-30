import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stage_zero_task/utils/app_links.dart';

import '../constants/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const platform = MethodChannel("github/methodchannel");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            const Text(
              'AppConnect',
              style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 35),
            ),
            SizedBox(height: size.height * 0.2),
            const Text(
              'Build, Share, and Hire!',
              style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 28),
            ),
            const SizedBox(height: 10),
            const Text(
              'Discover the power of open-source development and explore hiring opportunities for Android developers.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.baseBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            SizedBox(height: size.height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: AppColors.baseWhite,
                      fixedSize: Size(size.width * 0.4, 20)),
                  onPressed: () async {
                    await _openGitHubRepo(AppLinks.githubUrl);
                  },
                  child: const Text(
                    'GitHub Repo',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.primaryBlue,
                      backgroundColor: AppColors.secondaryBlue,
                      fixedSize: Size(size.width * 0.4, 20)),
                  onPressed: () async {
                    await _openGitHubRepo(AppLinks.hngBackLink);
                  },
                  child: const Text('Hire Talents'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openGitHubRepo(String url) async {
    try {
      await platform.invokeMethod('openBrowser', {"url": url});
    } on PlatformException catch (e) {
      debugPrint("Failed to open browser: ${e.message}");
    }
  }
}
