import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/model/wishlistmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  AddtoWishlist(
      String name, String prouctid, String image, int price, ctx) async {
    await FirebaseFirestore.instance
        .collection('Wishlist')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('User-Wishlist')
        .doc(prouctid)
        .set({
      'name': name,
      'url': image,
      'productid': prouctid,
      'price': price,
    }).whenComplete(() => {
              ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  'Product added in Wishlist',
                  style: TextStyle(fontSize: 15),
                ),
              ))
            });
  }

  List<WishlistModel> newWishlistdata = [];
  getWishlisttdata() async {
    List<WishlistModel> newlist = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection('Wishlist')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('User-Wishlist')
        .get();
    //print(reviewCartValue.docs['Productid']);

    reviewCartValue.docs.forEach((element) {
      WishlistModel revicartmodel = WishlistModel(
          productid: element.get('productid'),
          name: element.get('name'),
          price: element.get('price'),
          img: element.get('url'));

      newlist.add(revicartmodel);
    });
    newWishlistdata = newlist;
    notifyListeners();
  }

  List<WishlistModel> get getWishlistFinallist {
    return newWishlistdata;
  }

  deleteWishlist(productid) async {
    await FirebaseFirestore.instance
        .collection('Wishlist')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('User-Wishlist')
        .doc(productid)
        .delete();
  }



}
