import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/Appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cartsingleitem extends StatelessWidget {
  String? image;
  String? name;
  int? price;
  String?quntiy;
  bool? show = false;
  VoidCallback? delete;
  VoidCallback? wishlistdelete;



   cartsingleitem({Key? key,this.image,this.name,this.price,this.quntiy,this.show,this.delete,this.wishlistdelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 0),
       // margin: EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  '${image}',
                  height: 100,
                  width: 150,
                ),
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${name}',
                      style: TextStyle(
                          color: Appcolor.buttoncolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      width: 230,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rs.${price.toString()}',
                            style: TextStyle(fontSize: 16,color: Appcolor.buttoncolor),
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: wishlistdelete,
                                  child: Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: Appcolor.button,
                                  )),
                              SizedBox(
                                width: 2,
                              ),
                             show==true? InkWell(
                                  onTap:delete,
                                  child: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Appcolor.button,
                                  )):Container()
                            ],
                          )
                        ],
                      ),
                    ),
                    show==true?
                    Container(
                      decoration: BoxDecoration(
                          color: Appcolor.cardcolor,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                        child: Text('Quntity : ${quntiy}'),
                      ),
                    ):Container()
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
