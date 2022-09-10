import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/screen/cart.dart';
import 'package:flutter/material.dart';

class myTextfild extends StatelessWidget {
  String? hint;
  TextEditingController? controllerc;
  bool? maxline =  true;



  myTextfild({Key? key,this.hint,this.controllerc}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(

              controller: controllerc,
              decoration: InputDecoration(
                hintText: hint,
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(25))
              ),
            )
          ],
        ),
      ),
    );
  }
}

class drower extends StatefulWidget {
  const drower({Key? key}) : super(key: key);

  @override
  _drowerState createState() => _drowerState();
}

class _drowerState extends State<drower> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        //   width: 150,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: Appcolor.buttoncolor1,
              ),

              ListTile(
                onTap: (){},
                textColor: Appcolor.button,
                title: Text('HOME PAGE'),
              ),
              ListTile(
                onTap: (){},
                title: Text('PRODUCT PAGE'),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=>CartScreen()));


                },
                title: Text('CART PAGE'),
              ),
              ListTile(
                onTap: (){},
                title: Text('WISHLISHT'),
              ),
              ListTile(
                onTap: (){},
                title: Text('LOGOUT'),
              )

            ],

          ),
        ),
      ),
    );
  }
}

