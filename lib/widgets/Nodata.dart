import 'package:firbaseproject/Appcolor.dart';
import 'package:flutter/material.dart';
class nodata extends StatelessWidget {
  const nodata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      Colors.orange.shade200,
                      Colors.white,
                      Colors.green.shade200
                    ])),
                child: Text(
                  'NO DATA',
                  style: TextStyle(
                      fontSize: 20,
                      color: Appcolor.button,
                      fontWeight: FontWeight.w500),
                )),
          )),
    );
  }
}
