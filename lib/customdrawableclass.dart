import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'helpcontact.dart';

class CustomDrawableClass extends StatelessWidget {
  String text;
  CustomDrawableClass(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(text)),
    );
  }
}

class CustomSettingclass extends StatelessWidget {
  String text;
  String bigtext =
      "An online auction system in which we buy or sell products through biding. We are developing a software for online-Auction. online-Auction is known by several names,including Car, Machinery etc. If you want to something sell by auction then you post that on App. It just a selling of products. This project user can do a bid on particular Products. The main objective of the Auction process must be to obtain best value and the highest price and well source. There are two categories of persons one is customers and second one is vendor. Vendor can sell his products on this website and customer will purchase it. Product will be given to those customer who put a high bid price on product to purchase.";
  CustomSettingclass(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Image(
                  image: AssetImage('Assets/about.png'),
                ),
              ),
              Container(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none),
                ),
              ),
              //SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: Text(
                  bigtext,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      'Our Services',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none),
                    )),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Image(
                        image: AssetImage('Assets/services.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHelpContactClass extends StatelessWidget {
  String text;
  CustomHelpContactClass(this.text);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(text),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.blue[900],
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "How can we help you Today?",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Search PakAuction Help...",
                        hintStyle: TextStyle(color: Colors.grey[900]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
