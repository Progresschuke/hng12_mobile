import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter 3D Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  O3DController controller = O3DController();

  void _playAnimation() {
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 300,
                  width: size.width * 0.5,
                  child: O3D.asset(
                    autoPlay: true,
                    controller: controller,
                    animationName: 'assets/3d/F_Crouch_Strafe_Left.fbx',
                    src: 'assets/models/male.glb',
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: size.width * 0.5,
                  child: O3D.asset(
                    controller: controller,
                    animationName: 'assets/3d/F_Crouch_Strafe_Left.fbx',
                    src: 'assets/models/female.glb',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
