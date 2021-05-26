import 'package:black_coffer/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:black_coffer/screens/product_screen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final _firestore = FirebaseFirestore.instance;

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with TickerProviderStateMixin{

  AnimationController _controller;
  Animation animation;
  bool showSpinner = false;
  bool _passwordVisibility = false;
  bool _confirmPasswordVisibility = false;
  final _auth = FirebaseAuth.instance;
  String password;
  String conf_password;
  String email;
  String name;
  String mobile_number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                child: Lottie.asset(
                    'images/8603-profile.json',
                controller:_controller,
                  onLoaded: (composition){
                      _controller     //config AnimationController with the duration of lottie file and start animation
                          ..duration = composition.duration
                          ..forward();
                  }
                ),
              ),
            ),
            // Center(
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_sfmn3v5w.json'),
            //   ),
            // ),
            Padding(
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
                      'Register in to get started',
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'Name',
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      //icon E-mail ID
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
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Mobile Number',
                      ),
                      onChanged: (value) {
                        mobile_number = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
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
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmPasswordVisibility
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordVisibility = !_passwordVisibility;
                              });
                            },
                          )),
                      obscureText: _confirmPasswordVisibility ? false : true,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        conf_password = value;
                      },
                      //icon(lock) Password at end eye icon
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    TextButton(
                      child: Text(
                        'REGISTER',
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.orangeAccent,
                        elevation: 5.0,
                      ),
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          if(password == conf_password) {
                            final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                            if (newUser != null) {
                              _firestore.collection('user').add({

                                'name' : name,
                                'email' : email,
                                'phone': mobile_number,
                              });
                              Navigator.pushNamed(context,ProductScreen.id);
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an account?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
