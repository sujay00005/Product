import 'package:black_coffer/screens/login_screen.dart';
import 'package:black_coffer/components/lottie_animation.dart';
import 'package:black_coffer/screens/product_screen.dart';
import 'package:black_coffer/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartupView.id,
      routes:{
        LoginScreen.id : (context)=> LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ProductScreen.id: (context) => ProductScreen(),
        StartupView.id: (context) => StartupView(),
      }
    );
  }
}
