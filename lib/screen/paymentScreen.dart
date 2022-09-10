import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/provider/cartprovider.dart';
import 'package:firbaseproject/widgets/cartsingleitem.dart';
import 'package:firbaseproject/widgets/myButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final app = AppBar(
    backgroundColor: Appcolor.button,
    title: Text('Select Payment'),
  );

  String? ok;
  String? card;
  double? discount;
  double? total;
  double?deliver;
  CartProvider cartProvider = CartProvider();

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getcartdata();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: mybutton(name: 'Place Order',
        ontap:(){
          showAlertDialog(context);
        } ),
      ),
      backgroundColor: Appcolor.cardcolor,
      appBar: app,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          children: [
            Text(
              'Dlivery Address',
              style: TextStyle(fontSize: 20, color: Appcolor.button),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white38,
                ),
                child: Row(
                  children: [
                    Radio(
                        activeColor: Appcolor.buttoncolor,
                        value: 'ok',
                        groupValue: ok,
                        onChanged: (val) {
                          setState(() {
                            ok = val.toString();
                          });
                        },
                        splashRadius: 20),
                    Expanded(
                      child: Text(
                        'Anandnagar juna 3 maliya block no 6 room no 122,Pin code: 364001\nBhavnagar,\nGujrat',
                        style: TextStyle(
                            fontSize: 16, color: Appcolor.buttoncolor),
                      ),
                    ),
                  ],
                )),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, color: Appcolor.button),
            ),
            Divider(
              color: Appcolor.button,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white38,
                ),
                child: Column(
                  children: [
                    RadioListTile(
                      dense: true,
                      activeColor: Appcolor.buttoncolor,
                      value: 'Credit card',
                      groupValue: card,
                      onChanged: (value) {
                        setState(() {
                          card = value.toString();
                        });
                      },
                      title: Text(
                        'Caredit Card',
                        style: TextStyle(fontSize: 20, color: Appcolor.button),
                      ),
                    ),
                    RadioListTile(
                      dense: true,
                      activeColor: Appcolor.buttoncolor,
                      value: 'Debit card',
                      groupValue: card,
                      onChanged: (value) {
                        setState(() {
                          card = value.toString();
                        });
                      },
                      title: Text(
                        'Debit Card',
                        style: TextStyle(fontSize: 20, color: Appcolor.button),
                      ),
                    ),
                    RadioListTile(
                      dense: true,
                      activeColor: Appcolor.buttoncolor,
                      value: 'Cash On delivery',
                      groupValue: card,
                      onChanged: (value) {
                        setState(() {
                          card = value.toString();
                        });
                      },
                      title: Text(
                        'Cash On Dilevery',
                        style: TextStyle(fontSize: 20, color: Appcolor.button),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Appcolor.button,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white38,
                ),
                child: ExpansionTile(

                  title: Text(
                    'Total Items (${cartProvider.getFinallist.length})',
                    style: TextStyle(color: Appcolor.buttoncolor, fontSize: 20),
                  ),
                  children:cartProvider.getFinallist.map((e){

                    return cartsingleitem(image: e.img,
                      price: e.price,
                      name: e.name,
                      quntiy: e.qty.toString(),
                      show: true,


                    );
                  }).toList()
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Totale',
              style: TextStyle(fontSize: 20, color: Appcolor.button),
            ),
            Divider(
              color: Appcolor.button,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                //  height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white38,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Product Price',
                          style: TextStyle(
                              fontSize: 18,
                              color: Appcolor.button,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          cartProvider.gettotalPrice().toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Appcolor.button),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount (%6)',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Appcolor.button),
                        ),
                        Text(
                          '${discount = (cartProvider.gettotalPrice()*6)/100}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Appcolor.button),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dilever Charge',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Appcolor.button),
                        ),
                        Text(
                          '${deliver=(cartProvider.gettotalPrice()*3)/100}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Appcolor.button),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.red,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Rs.',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                        Text(
                          '${(cartProvider.gettotalPrice()- discount + deliver).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      title: Container(

        child:Column(
          children: [
            Image.asset('assets/success.jpg',width: 70,height: 70,),
            SizedBox(height: 20,),
            Text('Thank You For Order'),
            SizedBox(height: 20,),
            mybutton(
              ontap: (){
                Navigator.pop(context);
              },
              name: 'Ok',
            )
          ],
        )
        
      ),
      /*content: Container(
        color: Colors.red,
        height: 150,
        width: 150,
      ),*/

     /* actions: [
        cancelButton,
        continueButton,
      ],*/
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}





