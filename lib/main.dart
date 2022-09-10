

import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/commonn.dart';
import 'package:firbaseproject/model/fetchProduct.dart';
import 'package:firbaseproject/provider/WishlistProvider.dart';
import 'package:firbaseproject/provider/cartprovider.dart';
import 'package:firbaseproject/screen/Product.dart';
import 'package:firbaseproject/screen/homescreen.dart';
import 'package:firbaseproject/screen/login.dart';
import 'package:firbaseproject/screen/splasScreen.dart';
import 'package:firbaseproject/shared.dart';
import 'package:firbaseproject/widgets/progressindicater.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your applicatio//.

  // token

  //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



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider<WishlistProvider>(
            create: (context) => WishlistProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: FutureBuilder(
            future: common.autologin(),
            builder: (context,res){
              if(res.connectionState == ConnectionState.waiting){
                return myprogressindicater();
              }else{
                if(res.data==false){
                 return LoginScreen();
                }else{
                  return splasscreen();
                }
              }
            },
          )
      )
    );
  }




}

