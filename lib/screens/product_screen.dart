import 'package:black_coffer/components/ImageTopIcon.dart';
import 'package:black_coffer/components/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  static String id = 'product_screen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text(
            'Product',
          ),

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
      body: Column(
        children: [
          //top image
          Container(
            margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 65.0),
            width: MediaQuery.of(context).size.width,
            height: 300.0,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  child: Image(
                    image: AssetImage('images/Rectangle 23.png'),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ImageTopIcon(imageName: 'Icon ionic-ios-heart.png'),
                    SizedBox(
                      height: 20.0,
                    ),
                    ImageTopIcon(imageName: 'Icon awesome-share.png')
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 105.0),
          //texts
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Eyevy',
                  textAlign: TextAlign.start,
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

          // Buttons
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
      ),
    );
  }
}
