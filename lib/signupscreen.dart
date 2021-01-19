import 'package:auctionapp/loginscreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/border_radius.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _secureText = true;
  var fromkey = GlobalKey<FormState>();

  void toggle() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogInScreen()),
            );
          },
        ),
      ),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        // width: double.infinity,
        //   height: double.infinity,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("Assets/SignUp.jpg"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 25, 2, 0),
          child: Form(
            key: fromkey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
                child: new Column(
                  children: <Widget>[
                    Container(
                      child: Image(
                        image: AssetImage('Assets/logo1.png'),
                        width: 120,
                        height: 120,
                      ),
                    ),
                    SizedBox(height: 40),
                    new ListTile(
                      title: new TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'enter name';
                          } else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          hintText: "Full Name",
                          labelText: 'Name',
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5.0)),
                    new ListTile(
                      title: new TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'enter your email';
                          }
                          if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Invailid email';
                          } else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          hintText: "Email",
                          labelText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5.0)),
                    new ListTile(
                      title: new TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'enter phone no';
                          }
                          if (value.length < 10) {
                            return 'Insifficient no';
                          } else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          hintText: "phone no",
                          labelText: 'phone',
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5.0)),
                    new ListTile(
                      title: new TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'enter password';
                          }
                          if (value.length < 6) {
                            return 'Atleast six characters';
                          } else
                            return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          hintText: "Password",
                          labelText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: _secureText
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  ),
                            onPressed: toggle,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                        ),
                        obscureText: _secureText,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 150),
                      child: RichText(
                        text: TextSpan(
                            text: 'Forget Password ?',
                            //style: linkStyle,
                            recognizer: TapGestureRecognizer()..onTap = () {
                            }),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    RaisedButton(
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 125),
                      onPressed: () {
                        if (fromkey.currentState.validate()) {
                          return 'Ok';
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        //side: BorderSide(color: Colors.yellow,width: 1)
                      ),
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    new Center(
                      child: new RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text: 'Already have Account ?',
                              style: new TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            new TextSpan(
                              text: ' SingIn Now',
                              style: new TextStyle(color: Colors.blue,fontSize: 15),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    //),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(30.0,20,0,0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image(
                    //         image: AssetImage("Assets/facebook.png"),
                    //         height: 40,
                    //         width: 40,
                    //       ),
                    //       Padding(padding: EdgeInsets.all(8),),
                    //       Image(
                    //         image: AssetImage("Assets/instagram.png"),
                    //         height: 40,
                    //         width: 40,
                    //       ),
                    //       Padding(padding: EdgeInsets.all(8),),
                    //       Image(
                    //        image: AssetImage("Assets/twitter.png"),
                    //         height: 40,
                    //         width: 40,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
