import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/provider/WishlistProvider.dart';
import 'package:firbaseproject/widgets/Nodata.dart';
import 'package:firbaseproject/widgets/cartsingleitem.dart';
import 'package:firbaseproject/widgets/progressindicater.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wishlidt extends StatefulWidget {
  const Wishlidt({Key? key}) : super(key: key);

  @override
  _WishlidtState createState() => _WishlidtState();
}

class _WishlidtState extends State<Wishlidt> {
  WishlistProvider wishlistProvider = WishlistProvider();

  @override
  Widget build(BuildContext context) {
    wishlistProvider = Provider.of<WishlistProvider>(context);
    wishlistProvider.getWishlisttdata();
    return Scaffold(
      backgroundColor: Appcolor.cardcolor,
      body: wishlistProvider.getWishlistFinallist.isEmpty
          ? nodata()
          : ListView.builder(
              itemCount: wishlistProvider.getWishlistFinallist.length,
              itemBuilder: (context, index) {
                var data = wishlistProvider.getWishlistFinallist[index];
                return cartsingleitem(
                  name: data.name,
                  price: data.price,
                  image: data.img,
                  wishlistdelete: () {
                    wishlistProvider.deleteWishlist(data.productid);
                  },
                );
              }),
    );
  }
}
