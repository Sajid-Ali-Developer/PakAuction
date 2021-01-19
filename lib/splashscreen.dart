
import 'package:auctionapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auctionapp/loginscreen.dart';
import 'dart:async';
void main(){
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),() => Navigator.push(context,
       MaterialPageRoute(builder: (context) => LogInScreen()),));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red[400]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: 220),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('Assets/Splogo.png'),
                        backgroundColor: Colors.white,
                        radius: 50.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text("PakAuction",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text('Online Auction \n For Everyone',
                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
