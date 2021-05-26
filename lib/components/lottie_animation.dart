import 'package:black_coffer/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartupView extends StatefulWidget {
  const StartupView({Key key}) : super(key: key);
  static String id = 'StartupView';

  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE2840A),
      body: Stack(
        children: [
          Center(
          child: Lottie.asset('images/54932-splash-screen.json',
              controller: controller, onLoaded: (composition) {
            controller //config AnimationController with the duration of lottie file and start animation
              ..duration = composition.duration
              ..forward().whenComplete(
                  () => Navigator.pushNamed(context, RegistrationScreen.id));
            }),
          ),

    ],
      ),
    );
  }
}
