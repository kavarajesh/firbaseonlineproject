import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/screen/login.dart';
import 'package:firbaseproject/widgets/myButton.dart';
import 'package:firbaseproject/widgets/myTextfild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RagistrationScreen extends StatelessWidget {
  RagistrationScreen({Key? key}) : super(key: key);
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController rePassword = new TextEditingController();
  TextEditingController name = new   TextEditingController();
  TextEditingController city = new   TextEditingController();
  TextEditingController lastname = new   TextEditingController();
  final fomk = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: fomk,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create New Account User',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.indigo,

                ),),
                Image.asset(
                  'assets/icon.png',
                  height: 150,
                  width: 150,
                  color: Colors.indigo.shade400,
                ),
                Card(
                  elevation: 5,
                  //shadowColor: Colors.red,
                  color: Appcolor.cardcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Container(
                      //height: MediaQuery.of(context).size.height*0.5,
                      //width: MediaQuery.of(context).size.width*0.9,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter name ';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter Name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: lastname,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter last name';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter last name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          TextFormField(
                            controller: email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Email ';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Email ';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: rePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Email ';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Re password',
                                fillColor: Colors.redAccent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: city,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter City ';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                hintText:'Ciry',
                                fillColor: Colors.redAccent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          mybutton(
                            name: 'Create New Account',
                            ontap: () {
                              if (fomk.currentState!.validate()) {

                                if (password.text == rePassword.text) {
                                  try {
                                    userdata();
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                        email: email.text, password: password.text)
                                        .whenComplete(() {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              backgroundColor:Colors.green
                                              ,content: Text('Create New Account',style: TextStyle(
                                              fontSize: 20
                                          ),)));
                                      Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (_) => LoginScreen()));
                                    });
                                  } catch (e) {
                                    print('=====${e.toString()}');
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                      backgroundColor:Colors.redAccent
                                          ,content: Text('Password Not match',style: TextStyle(
                                        fontSize: 20
                                      ),)));
                                }
                              }
                            },
                          )

                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  userdata()async
  {
    await FirebaseFirestore.instance.collection('Userdata').doc(email.text).set({
      'Email':email.text,
      'Password':password.text,
      'Frist name':name.text,
      'Last name':lastname.text,
      'City':city.text
    });
  }
}
