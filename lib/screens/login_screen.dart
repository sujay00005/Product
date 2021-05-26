import 'package:black_coffer/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  bool _passwordVisibility = false;
  String password;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'Log in to get started',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Experience the all new App!',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  hintText: 'E-Mail ID',
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    //icon: Image.asset("assets/home.png", color: Colors.grey,),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisibility
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisibility = !_passwordVisibility;
                        });
                      },
                    )),
                obscureText: _passwordVisibility ? false : true,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  password = value;
                },

                //icon(lock) Password at end eye icon
              ),
              SizedBox(
                height: 30.0,
              ),
          Text(
            'Use Mobile Number',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18,
              color: Colors.orangeAccent,

            ),
          ),
              Spacer(),
              Divider(
                color: Colors.grey,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: Text(
                    'Login',
                  ),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ProductScreen.id);
                        setState(() {
                          showSpinner = false;
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ),
          ),
      ),
    );
  }
}
