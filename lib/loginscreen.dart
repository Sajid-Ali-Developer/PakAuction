import 'package:auctionapp/customdrawableclass.dart';
import 'package:auctionapp/dashboard.dart';
import 'package:auctionapp/helpcontact.dart';
import 'package:auctionapp/signupscreen.dart';
import 'package:auctionapp/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'main.dart';
import 'notfication.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('OnlineAuction'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[900],
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.white),
                      )),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Material(
                            child: Image.asset(
                              'Assets/Asset 1.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        Text(
                          'OnlineSystem',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )),

              //),
              CustomTileList(Icons.home, 'Home'),
              CustomTileList(Icons.person, 'About Us'),
              CustomTileList(Icons.notifications, 'Notifications'),
              CustomTileList(Icons.category, 'Categories'),
              CustomTileList(Icons.contact_phone, 'Contact'),
              CustomTileList(Icons.help, 'Help'),
              CustomTileList(Icons.logout, 'Logout'),
              Container(
                margin: EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Text(
                      'University of Engineering and Technology, Peshawar',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        Text(
                          'sajidkhanbaloch880@gmail.com',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            child: Icon(
                              Icons.contact_phone,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Text(
                          '03478586243',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyImageview(),
              SizedBox(height: 200),
              Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Container(
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 125),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInPage()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text('LogIn'),
                          textColor: Colors.white,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 120),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.yellow, width: 1),
                        ),
                        child: Text('Sign Up'),
                        textColor: Colors.white,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget MyImageview() {
    return Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage("Assets/image1.jpg"),
        AssetImage("Assets/image2.jpg"),
        AssetImage("Assets/image3.jpg"),
        AssetImage("Assets/image4.jpg"),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(
        microseconds: 3000,
      ),
    );
  }
}

class CustomTileList extends StatelessWidget {
  IconData incondata;
  String text;
  CustomTileList(this.incondata, this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: InkWell(
          onTap: () => {
            if (text == "Home")
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoard()),
                )
              }
            else if (text == 'Profile')
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CustomDrawableClass('this is my profile')))
              }
            else if (text == 'About Us')
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CustomSettingclass('About Auction')))
              }
            else if (text == 'Help')
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CustomHelpContactClass(this.text)))
              }
            else if (text == 'Contact')
              {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Example()))
              }
            else if (text == 'Notifications')
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()))
              }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
            ),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      incondata,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
