import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/firebase_services/firebase.dart';
import 'package:firbaseproject/model/cartmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Future<dynamic> Addcart(
      String Productid, String name, String image, int price,int qty, ctx) async {
    await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('UserCart')
        .doc(Productid)
        .set({
      'Productid': Productid,
      'ProductName': name,
      'Image': image,
      'Price': price,
      'Quntity': qty
    }).whenComplete(() {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Product Added in Cart.....',
            style: TextStyle(fontSize: 15),
          )));
    });
  }

  List<CartModel> newlistdata = [];
  getcartdata() async {
    List<CartModel> newlist = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('UserCart')
        .get();
    //print(reviewCartValue.docs['Productid']);

    reviewCartValue.docs.forEach((element) {
      CartModel revicartmodel = CartModel(
          productid: element.get('Productid'),
          name: element.get('ProductName'),
          price: element.get('Price'),
          img: element.get('Image'),
          qty: element.get('Quntity'));
      newlist.add(revicartmodel);
    });
    newlistdata = newlist;
    notifyListeners();
  }

  List<CartModel> get getFinallist {
    return newlistdata;
  }

  deleteCart(deleteId) async {
    await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('UserCart')
        .doc(deleteId)
        .delete();
  }
  gettotalPrice(){
    double total = 0.0;
    newlistdata.forEach((element) {
      total +=  element.price!.toInt()*element.qty!;
    });
    return total;
  }
}
