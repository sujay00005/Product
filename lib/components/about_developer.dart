import 'package:flutter/material.dart';

class AboutDeveloper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
              ),
              Text('Sujay Biswas',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    letterSpacing: 2.5,
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              Text('FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 15.0,
                    letterSpacing: 3.5,
                    color: Colors.black,
                  )),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      Text(
                        '   +91 7292998781',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    ]),
                  )),
              SizedBox(
                height: 10.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      Text(
                        '   sujay00005@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
}