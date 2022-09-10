import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/admin/addproduct.dart';
import 'package:firbaseproject/commonn.dart';
import 'package:firbaseproject/screen/CheckOut.dart';
import 'package:firbaseproject/screen/UserdetailScreen.dart';
import 'package:firbaseproject/screen/cart.dart';
import 'package:firbaseproject/screen/login.dart';
import 'package:firbaseproject/screen/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      // width: 350,
      backgroundColor: Appcolor.cardcolor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            height: 150,
            color: Appcolor.button,
            child: ListTile(
              title: Text(
                'Kava Rajesh',
                style: TextStyle(
                  fontSize: 20,
                  color: Appcolor.cardcolor,
                ),
              ),
              leading: Icon(
                Icons.face,
                color: Appcolor.cardcolor,
                size: 50,
              ),
              subtitle: Text(
                'Rajesh123@gmail.com',
                style: TextStyle(color: Appcolor.cardcolor, fontSize: 16),
              ),
            ),
          ),

          //Image.asset('assets/icon.png',width: 100,height: 100,),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 6),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>UserdetailScreenAdd()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Appcolor.button,
                        size: 30,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Profile',
                        style: TextStyle(fontSize: 17,color: Appcolor.button),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AddProduct()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_box,
                        color: Appcolor.button,
                        size: 30,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Add New Product',
                        style: TextStyle(fontSize: 17,color: Appcolor.button),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                ////
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CartScreen()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Appcolor.button,
                        size: 30,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Cart',
                        style: TextStyle(fontSize: 17,color: Appcolor.button),
                      )
                    ],
                  ),
                ),

                Divider(thickness: 2),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Wishlidt()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Appcolor.button,
                        size: 30,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Wishlist',
                        style: TextStyle(fontSize: 17,color: Appcolor.button),
                      )
                    ],
                  ),
                ),
                Divider(thickness: 2),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CheckOutScreen()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Appcolor.button,
                        size: 30,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Settings',
                        style: TextStyle(fontSize: 17,color: Appcolor.button),
                      )
                    ],
                  ),
                ),
                Divider(thickness: 2),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Appcolor.button,
                        size: 30,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Logout',
                        style: TextStyle(fontSize: 17,color: Appcolor.button),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
