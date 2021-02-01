import 'dart:io';
import 'package:auctionapp/customdashboard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DataActivity extends StatefulWidget {
  DataActivity() : super();

  @override
  _DataActivityState createState() => _DataActivityState();
}

class _DataActivityState extends State<DataActivity> {
  Future<File> imageFile;
  File imageFileReturn;
  final myNameController = TextEditingController();
  final myPriceController = TextEditingController();

  void dispose() {
    myNameController.dispose();
    myPriceController.dispose();
    super.dispose();
  }

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Product Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageFile == null
                ? Container(
                    margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFe0f2f1),
                    child: IconButton(
                      onPressed: () {
                        pickImageFromGallery(ImageSource.gallery);
                      },
                      icon: Icon(
                        Icons.add,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(20),
                    child: showImage(),
                  ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: TextFormField(
                        controller: myNameController,
                        decoration: new InputDecoration(
                          hintText: "Info",
                          labelText: 'Name&Model',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: TextFormField(
                        controller: myPriceController,
                        decoration: new InputDecoration(
                          hintText: "Mini Price",
                          labelText: 'Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.grey[800],
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 80),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(myNameController.text),
                        content: Text(
                          'Successfully Submitted',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900]),
                        ),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (_) {
                                  return ReceiveData(myNameController.text,
                                      myPriceController.text, imageFileReturn);
                                }));
                              },
                              child: Text('Ok'))
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        imageFileReturn = snapshot.data;
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(snapshot.data,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill);
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
}
