import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/admin/addproduct.dart';
import 'package:firbaseproject/commonn.dart';
import 'package:firbaseproject/firebase_services/firebase.dart';
import 'package:firbaseproject/main.dart';
import 'package:firbaseproject/screen/homescreen.dart';
import 'package:firbaseproject/screen/ragitration.dart';
import 'package:firbaseproject/screen/splasScreen.dart';
import 'package:firbaseproject/shared.dart';
import 'package:firbaseproject/widgets/myButton.dart';
import 'package:firbaseproject/widgets/myTextfild.dart';
import 'package:firbaseproject/widgets/progressindicater.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  FirebaseServices services = new FirebaseServices();
  final _formkey = GlobalKey<FormState>();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Form(
      key: _formkey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: isloading
                ? myprogressindicater()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon.png',
                        height: height / 4,
                        color: Appcolor.button,
                      ),
                      Card(
                        color: Appcolor.cardcolor,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          // height: height / 1.6,
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  style: TextStyle(),
                                  controller: email,
                                  validator: (v) {
                                    if (v!.isNotEmpty) {
                                      return 'fill email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.red,
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Appcolor.button,
                                      size: 30,
                                    ),
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: TextStyle(),
                                  controller: password,
                                  validator: (v) {
                                    if (v!.isNotEmpty) {
                                      return 'fill email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Colors.red,
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Appcolor.button,
                                      size: 30,
                                    ),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                mybutton(
                                  ontap: () {
                                    setState(() {
                                      isloading = true;
                                    });
                                    loginuser();
                                    // Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=>HomeScreen()));
                                  },
                                  name: 'Login',
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  RagistrationScreen()));
                                    },
                                    child: Text(
                                      'Create New Account',
                                      style: TextStyle(
                                          fontSize: 15, color: Appcolor.button),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.apple_outlined,
                            color: Appcolor.button,
                            size: 50,
                          ),
                          Icon(
                            Icons.facebook,
                            color: Appcolor.button,
                            size: 50,
                          ),
                          Icon(
                            Icons.email,
                            color: Appcolor.button,
                            size: 45,
                          )
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  loginuser() async {
    try {
      UserCredential? result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        print('${value}---------');
        if (value.user!.emailVerified == true) {
          setState(() {
            isloading = false;
          });
        }
        Shared.Writestring('userid', value.user!.uid.toString());
        //common.Logincheck(value.user!.uid.toString());
        Shared.RedString('userid');
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => splasscreen()));
      });
      print('///result//////${result}');
    } catch (e) {
      print(e.toString() + 'errorr========>');
      setState(() {
        isloading = false;
      });
    }
    // prod.doc('fGFDOFRFw8K0SEbuh6DT').collection('usersubcallection').add({'subcallectionfild':'sub1'});
  }

  login(email, password) async {
    final url = 'http://192.168.133.55/android/ws/login.php?';
    Map<String, dynamic> data = {'email': email, 'password': password};
    var res = await http.post(Uri.parse(url), body: data);
    print('============>${res.body.toString()}');
    try {
      var decoderes = jsonDecode(res.body);
      if (res.statusCode == 200) {
        if (decoderes[1]['success'] == 'yes') {
          print(decoderes[2]['message']);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              elevation: 2,
              backgroundColor: Colors.red,
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(decoderes[2]['message']),
              )));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
