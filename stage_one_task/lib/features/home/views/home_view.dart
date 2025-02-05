import 'package:stage_one_task/_lib.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      appBar: AppBar(
        backgroundColor: AppColors.baseWhite,
        elevation: 0,
        title: "Secure Data".text.bold,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              "Input your text and generate a secure encrypted output."
                  .text
                  .p1
                  .w5
                  .center,
              SizedBox(height: size.height * 0.05),
              Image.asset(
                AppAssets.phoneLock,
                height: 150,
              ),
              SizedBox(height: size.height * 0.1),
              const EncryptFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
