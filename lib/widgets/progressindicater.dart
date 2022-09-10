import 'package:flutter/material.dart';

import '../Appcolor.dart';
class myprogressindicater extends StatelessWidget {
  const myprogressindicater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          elevation: 5,
          child: Container(
            padding:
            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: Appcolor.cardcolor,
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Appcolor.button,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Proccess Data',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Appcolor.button),
                )
              ],
            ),
          ),
        ));
  }
}
