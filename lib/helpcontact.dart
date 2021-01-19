import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Example extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  List _locations = ['Enquiry', 'Complain', 'Suggestion','Requestion an Auction' ,'Deposit Refund','Tech Support']; // Option 2
  String _selectedLocation; // Option 2
  final CameraPosition _initialcameraposition = CameraPosition(target: LatLng(34.025917, 71.560135));
   GoogleMapController _controller;
   final List<Marker> markers = [];
   addMarker(cordinate){
     int id = Random().nextInt(100);
     setState(() {
       markers.add(Marker(position: cordinate,markerId: MarkerId(id.toString())));
     });
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact us'),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0,35,16,16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.grey[700],width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(left: 16,right: 16),
                    child: DropdownButton(
                      hint: Text('Please choose a location'), // Not necessary for Option 1
                      value: _selectedLocation,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                      items: _locations.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16,10,16,0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.symmetric(vertical: 17,horizontal: 10),
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: new BorderSide(color: Colors.yellow, width: 5),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16,20,16,0),
                  child: TextField(
                    maxLines: 5,
                    maxLength: 200,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.fromLTRB(10,0,10,60),
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: new BorderSide(color: Colors.yellow, width: 5),
                      ),
                    ),
                  ),
                ),
                RaisedButton(onPressed: (){
                },
                  child: Text('Send',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 100),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
      ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                  child: GoogleMap(
                    initialCameraPosition: _initialcameraposition,
                    mapType: MapType.normal,
                    onMapCreated: (Controler){
                      setState(() {
                        _controller = Controler;
                      });
                    },
                    markers: markers.toSet(),
                    onTap: (Cordinates){
                      addMarker(Cordinates);
                      _controller.animateCamera(CameraUpdate.newLatLng(Cordinates));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}