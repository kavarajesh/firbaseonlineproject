import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/widgets/progressindicater.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductModel {
  String? category;
  String? code;
  String? detail;
  String? id;
  String? name;
  int? price;
  String? url;
  bool islod = true;

  ProductModel(
      {required this.category,
      required this.code,
      required this.detail,
      required this.id,
      required this.name,
      required this.price,
      required this.url});

  static Future<void> adddata(ProductModel product) async {


    CollectionReference prod = FirebaseFirestore.instance.collection('product');

    Map<String,dynamic> data = {
      'category':product.category,
      'code':product.code,
      'detail':product.detail,
      'id':product.id,
      'name':product.name,
      'price':product.price,
      'url':product.url
    };
    await  prod.add(data);
    print(data);
  }
  static Future<void> updatedata(String id ,ProductModel up)async{

  }

}
