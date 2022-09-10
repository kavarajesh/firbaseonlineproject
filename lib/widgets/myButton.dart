import 'package:flutter/material.dart';

import '../Appcolor.dart';

class mybutton extends StatelessWidget {

  String? name;
  String? msg;
  //void Function? ontap();
  VoidCallback? ontap;


  mybutton({Key? key,this.name,this.msg,this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap,
      child: Container(
        height: 53,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Appcolor.button, borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 3,color: Colors.amber)),
        child: Center(
          child: Text(
            '$name',
            style: const TextStyle(
                fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
