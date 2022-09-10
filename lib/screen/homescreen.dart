import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/provider/cartprovider.dart';
import 'package:firbaseproject/screen/cart.dart';
import 'package:firbaseproject/screen/login.dart';
import 'package:firbaseproject/screen/productdetail.dart';
import 'package:firbaseproject/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/WishlistProvider.dart';
import '../widgets/progressindicater.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool buy = false;
  int? selcteditem = 0;
  CartProvider cartprovider = new CartProvider();
  WishlistProvider wishlistprovider = new WishlistProvider();
  @override
  Widget build(BuildContext context) {
    cartprovider = Provider.of<CartProvider>(context);
    wishlistprovider = Provider.of<WishlistProvider>(context);

    // prd.getFreshProductDataList();
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    Shared shared = new Shared();
    return Scaffold(
      backgroundColor: Appcolor.cardcolor,
      // bottomNavigationBar: bottombar(),

      /* BottomNavigationBar(
        onTap: (selected){
          switch(selected){
            case 0 :
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
              break;
            case 1 :print('person');
            break;
            case 2 : print('setting');
          }

        setState(() {
          selcteditem = selected;
        });},
          currentIndex:int.parse(selcteditem.toString()),
          backgroundColor: Appcolor.background,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
           // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting')
          ]
      ),*/
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 5),
          //margin: EdgeInsets.only(top: 12),
          height: 700,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('product')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: myprogressindicater(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, int i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => productDetail(
                                  productid: snapshot.data!.docs[i]['id'],
                                    productname: snapshot.data!.docs[i]
                                        ['name'],
                                    price: snapshot.data!.docs[i]['price'],
                                    url: snapshot.data!.docs[i]['url'],
                                    detail: snapshot.data!.docs[i]
                                        ['detail'])));
                          },
                          child: Container(

                           // height: 150,
                            child: Card(
                                surfaceTintColor: Colors.red,
                              elevation: 6,
                              shadowColor: Appcolor.button,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 5,),
                                    Image.network(
                                      '${snapshot.data!.docs[i]['url']}',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      '${snapshot.data!.docs[i]['name']}'
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Appcolor.buttoncolor,
                                          overflow: TextOverflow.clip,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 25,
                                            width: 80,
                                            //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                            decoration: BoxDecoration(
                                              color: Appcolor.buttoncolor,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Text(
                                              'Rs.${snapshot.data!.docs[i]['price']}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  cartprovider.Addcart(
                                                      snapshot.data!.docs[i]
                                                      ['id'],
                                                      snapshot.data!.docs[i]
                                                      ['name'],
                                                      snapshot.data!.docs[i]
                                                      ['url'],
                                                      snapshot.data!.docs[i]['price'],
                                                      1,
                                                      context);
                                                  print('cart');
                                                },
                                                child: Icon(
                                                  Icons.shop_outlined,
                                                  color: Appcolor.buttoncolor,
                                                  size: 30,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  print('wishlist');
                                                  wishlistprovider
                                                      .AddtoWishlist(
                                                      snapshot.data!
                                                          .docs[i]
                                                      ['name'],

                                                      snapshot.data!
                                                          .docs[i]['id'],
                                                      snapshot.data!
                                                          .docs[i]['url'],
                                                      snapshot.data!
                                                          .docs[i]
                                                      ['price'],
                                                      context);
                                                },
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: Appcolor.buttoncolor,
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          )

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                        // Text(snapshot.data!.docs[i]['url'].toString());
                      },
                    ),
                  );

                  //Center(child: Text(snapshot.data!.docs.['id'].toString()));
                }
              }),
        ),
      ),
    );
  }


  Widget bottombar() {
    //bottombar widget
    return BottomAppBar(
        elevation: 3,
        notchMargin: 5,
        color: Appcolor.button,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 25, left: 25, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.home, color: Colors.white, size: 30),
              Icon(Icons.favorite_border, color: Colors.white, size: 30),
              Icon(Icons.person_add, color: Colors.white, size: 30),
              InkWell(
                  onTap: () {
                    //shared.Writestring('id', '1');
                    //Shared.RedString('id');
                    // Shared.Redint('no');
                    Shared.RedString('userid');
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => CartScreen()));
                  },
                  child:
                      Icon(Icons.shopping_cart, color: Colors.white, size: 30)),
              InkWell(
                  onTap: () {
                    //shared.Writestring('userid', "");
                    //shared.Writeint('no', 0);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Icon(Icons.logout, color: Colors.white, size: 30)),
            ],
          ),
        ));
  }
}
