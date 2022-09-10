import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel{
  String? productid;
  String?  userid;
  String? name;
  int? price;
  String? img;
  int? qty;

  CartModel({required this.productid,this.qty,required this.name,required this.price,required this.img});

  

}