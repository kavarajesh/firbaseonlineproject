import 'package:firbaseproject/screen/cart.dart';
import 'package:firbaseproject/screen/wishlist.dart';
import 'package:firbaseproject/shared.dart';
import 'package:firbaseproject/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Appcolor.dart';
import 'homescreen.dart';
import 'login.dart';

class splasscreen extends StatelessWidget {
  const splasscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            drawer: myDrawer(),
            appBar: AppBar(
              title: Text('Gujrati Shoping'),
              actions: [
                IconButton(
                    onPressed: ()async {

                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.remove('userid');
                      print(Shared.RedString('userid'));
                   FirebaseAuth.instance.signOut().whenComplete(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      });

                    },
                    icon: Icon(
                      Icons.logout,
                      size: 25,
                    )),
              ],
              backgroundColor: Appcolor.buttoncolor,
              bottom: const TabBar(
                unselectedLabelColor: Appcolor.cardcolor,
                labelColor: Colors.amber,
                indicatorColor: Colors.amber,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                      size: 25,
                    ),
                  ),
                  Tab(
                      icon: Icon(
                    Icons.favorite,
                    size: 25,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.shopping_cart,
                    size: 25,
                  )),
                ],
              ),
        ),
    body: TabBarView(
      children: [
        const HomeScreen(),
        //Icon(Icons.directions_transit),
        Wishlidt(),
        CartScreen()
      ],
    ),)
    );
  }
}
