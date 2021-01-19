
import 'dart:io';

import 'package:auctionapp/dataactivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomDasboard extends StatelessWidget {
  CustomDasboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catagories'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        height: 56,
        //margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 66,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.chat, color: Colors.white),
                  Text("CHAT", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            Container(
              width: 66,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.notifications_active, color: Colors.white),
                  Text("NOTIF", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DataActivity()),);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text("As a Seller", style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReceiveData extends StatefulWidget {
  String name,price;
  File _imageFile;
  ReceiveData(this.name,this.price, this._imageFile);
  @override
  _ReceiveDataState createState() => _ReceiveDataState();
}

class _ReceiveDataState extends State<ReceiveData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catagories'),
        centerTitle: true,
      ),
      body: _buildListView(),
    );
  }
  ListView _buildListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          //padding: EdgeInsets.fromLTRB(2, 10, 0, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[700],width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                //padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                  width:100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.file(widget._imageFile,fit: BoxFit.cover)),
                ),
                 // child: FutureBuilder<File>(
                 //    future: imagefile,
                 //    builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                 //      _imageFile = snapshot.data;
                 //      if (snapshot.connectionState == ConnectionState.done &&
                 //          snapshot.data != null) {
                 //        return Image.file(snapshot.data,
                 //            height: 300, width: 300, fit: BoxFit.fill);
                 //      } else if (snapshot.error != null) {
                 //        return const Text(
                 //          'Error Picking Image',
                 //          textAlign: TextAlign.center,
                 //        );
                 //      } else {
                 //        return const Text(
                 //          'No Image Selected',
                 //          textAlign: TextAlign.center,
                 //        );
                 //      }
                 //    },
                 //  ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: TextStyle(fontSize: 15,color: Colors.grey),),
                    SizedBox(height: 5,),
                    Text('Time: 24:0:0', style: TextStyle(fontSize: 15,color: Colors.grey),),
                    SizedBox(height: 5,),
                    Text(widget.price, style: TextStyle(fontSize: 15,color: Colors.grey),),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: FlatButton(onPressed: (){
                },
                  color: Colors.red,
                  child: Text('Bid',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
