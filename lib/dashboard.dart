import 'package:auctionapp/customdashboard.dart';
import 'package:auctionapp/splashscreen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'dart:async';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: DashBoard(),
));
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:Column(
        children: [
          SizedBox(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                images: [
                  AssetImage("Assets/image1.jpg"),
                  AssetImage("Assets/image2.jpg"),
                  AssetImage("Assets/image3.jpg"),
                  AssetImage("Assets/image4.jpg"),
                  AssetImage("Assets/image5.jpg"),
                  AssetImage("Assets/image6.jpg"),
                  AssetImage("Assets/image7.jpg"),
                  AssetImage("Assets/image8.webp"),
                  AssetImage("Assets/image9.jpg"),
                  AssetImage("Assets/image10.jpg"),
                  AssetImage("Assets/image11.jpg"),
                ],
              )
          ),
          Container(
            //color: Colors.grey[400],
            child:Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                children: <Widget>[
                  makeDashboardItem("Cars", Icons.directions_car_sharp,context),
                  makeDashboardItem("Machinary", Icons.precision_manufacturing_outlined,context),
                  makeDashboardItem("Building", Icons.house,context),
                  makeDashboardItem("Antiques", Icons.assistant,context),
                  makeDashboardItem("Electronic", Icons.electrical_services_outlined,context),
                  makeDashboardItem("Sceneryies", Icons.image,context),
                  makeDashboardItem("Watches", Icons.watch_outlined,context),
                  makeDashboardItem("Mix Auction", Icons.military_tech,context),
                  makeDashboardItem("Services", Icons.design_services,context),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget MyImageview(){
    return Carousel(
      boxFit: BoxFit.fill,
      images: [
        AssetImage("Assets/image1.jpg"),
        AssetImage("Assets/image2.jpg"),
        AssetImage("Assets/image3.jpg"),
        AssetImage("Assets/image4.jpg"),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(microseconds: 3000,
      ),
    );
  }
}


Card makeDashboardItem(String title, IconData icon,BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.redAccent[400],
      elevation: 1.0,
      margin: new EdgeInsets.all(10.0),
      child: Container(
        child: new InkWell(
            onTap: () {
              if(title == 'Cars'){
                Navigator.push(context,MaterialPageRoute(builder:(context) => CustomDasboard()),);
              }
              else if(title == 'Machinary'){
                Navigator.push(context,MaterialPageRoute(builder:(context) => CustomDasboard()),);
              }

            },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Icon(
                    icon,
                    size: 35.0,
                    color: Colors.white,
                  ),
              SizedBox(height: 3.0),
               Text(title,
                    style:
                    TextStyle(fontSize: 12.0, color: Colors.white,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ));
  }