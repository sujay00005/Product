import 'package:black_coffer/components/about_developer.dart';
import 'package:flutter/material.dart';

class DrawerCreation extends StatelessWidget {
  const DrawerCreation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: Column(
              children: [
                Container(
                  width: 60.0,
                  height: 60,
                  margin: EdgeInsets.only(top:20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/cart.png'),
                        fit: BoxFit.fill,
                      )

                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Shopping Info',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
              title: Text('Account'),
              onTap: () {
                //Navigator.pop(context);
              }),
          ListTile(title: Text('Cart'), onTap: () {}),
          ListTile(title: Text('Orders'), onTap: () {}),
          ListTile(title: Text('Wishlist'), onTap: () {}),
          ListTile(title: Text('About Developer'), onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return AboutDeveloper();
            },
            ),
            );
          }),
        ],
      ),
    );
  }
}
