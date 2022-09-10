import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/widgets/myButton.dart';
import 'package:firbaseproject/widgets/myTextfild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Appcolor.cardcolor,
          appBar: AppBar(
            backgroundColor: Appcolor.button,
            title: Text('Add Address'),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: mybutton(name: 'Place Order'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
            child: ListView(
                children: [
              myTextfild(
                hint: 'Name',
              ),
              myTextfild(
                hint: 'Last Name',
              ),
              myTextfild(
                hint: 'Mobile No',
              ),
              myTextfild(
                hint: 'Address 1',
              ),
              myTextfild(
                hint: 'Adrress 2',
              ),
              myTextfild(
                hint: 'City',
              ),
              myTextfild(
                hint: 'State',
              ),
              myTextfild(
                hint: 'Area Pincode',
              ),
              Spacer(),
              // Radio(value: , groupValue: groupValue, onChanged:(value){})
            ]),
          ),
        ),
      ),
    );
  }
}


