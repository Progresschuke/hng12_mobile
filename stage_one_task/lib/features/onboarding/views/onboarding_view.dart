import '../../../_lib.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScaffold(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.12),
          Image.asset(
            AppAssets.lock,
            height: 250,
          ),
          SizedBox(height: size.height * 0.2),
          "Welcome to SecureCrypt! 🔐"
              .text
              .h1
              .center
              .textColor(AppColors.primary)
              .bold,
          const SizedBox(height: 8),
          "Effortlessly unlock encrypted information when needed."
              .text
              .p
              .center
              .textColor(AppColors.baseBlack.withOpacity(0.5)),
          const SizedBox(height: 40),
          CustomElevatedButton(
            text: "Let's Start →",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
