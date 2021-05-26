import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:black_coffer/components/drawer.dart';

class ProductScreen extends StatefulWidget {
  static String id = 'product_screen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //To change the icon of drawer  present on appBar usually

      appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text(
            'Product',
          ),

          //when only one icon
          // leading: IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () => Scaffold.of(context).openDrawer(),
          // ),

          //action becomes trailing component of navigation toolbar
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ]),

      drawer: DrawerCreation(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 10.0, top: 80.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image(
                      image: AssetImage('images/Rectangle 23.png'),
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(blurRadius: 4, color: Colors.grey)
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 24.0,
                            foregroundColor: Colors.grey,
                            backgroundColor: Colors.white,
                            child: ImageIcon(
                              AssetImage('images/Icon ionic-ios-heart.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(blurRadius: 4, color: Colors.grey)
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 24.0,
                            foregroundColor: Colors.grey,
                            backgroundColor: Colors.white,
                            child: ImageIcon(
                              AssetImage('images/Icon awesome-share.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 105,
                  ),
                  Text(
                    'Eyevy                                                  ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Full Rim Round,Cat-eyed Anti Glare Frame(48 mm)',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        '₹219',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 31.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '₹999',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        '78%off',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'ADD TO CART',
                        ),
                        style: TextButton.styleFrom(
                          //shape: OutlinedBorder,
                          side: BorderSide(color: Colors.grey, width: 0.5),
                          primary: Colors.black54,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'BUY NOW',
                        ),
                        style: TextButton.styleFrom(
                          side: BorderSide(color: Colors.white70, width: 0.5),
                          primary: Colors.white,
                          backgroundColor: Colors.orangeAccent,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

