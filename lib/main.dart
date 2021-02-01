import 'package:auctionapp/forgetpassword.dart';
import 'package:auctionapp/loginscreen.dart';
import 'package:auctionapp/dashboard.dart';
import 'package:auctionapp/signupscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _secureText = true;
  var formkey = GlobalKey<FormState>();
  String mypassword;

  void toggle() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  // String validate() {
  //   if (formkey.currentState.validate()) {
  //     return ("Validated");
  //   } else {
  //     return ("Invalid");
  //   }
  //}
  String validatePass(value) {
    if (value.isEmpty) {
      return 'enter your email';
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Invailid email';
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogInScreen()),
            );
          },
        ),
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Image(
                        image: AssetImage('Assets/logo1.png'),
                        width: 120,
                        height: 120,
                      ),
                    ),
                    // const Divider(
                    //   thickness: 2,
                    //   height: 20,
                    //   color: Colors.white,
                    // ),
                    SizedBox(height: 60),
                    TextFormField(
                      validator: validatePass,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'E-mail or Phone no',
                        labelText: 'E-mail',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      onSaved: (String password) {
                        mypassword = password;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'enter password';
                        }
                        if (value.length < 6) {
                          return 'atleast six characters';
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        prefixIcon: Icon(
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
                      ),
                      obscureText: _secureText,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 150),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ForgetPassword()),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Forget Password ?',
                            //style: linkStyle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      onPressed: () {
                        //validator: validate();
                        if (formkey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard()));
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      textColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 120),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Center(
                      child: new RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text: "Don't have Account ?",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            new TextSpan(
                              text: ' Registor Now',
                              style: new TextStyle(
                                  color: Colors.blue, fontSize: 15),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) {
                                    return SignUpScreen();
                                  }));
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
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
