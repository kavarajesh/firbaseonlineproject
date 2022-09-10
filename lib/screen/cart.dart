import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/model/cartmodel.dart';
import 'package:firbaseproject/provider/WishlistProvider.dart';
import 'package:firbaseproject/provider/cartprovider.dart';
import 'package:firbaseproject/screen/CheckOut.dart';
import 'package:firbaseproject/screen/paymentScreen.dart';
import 'package:firbaseproject/widgets/Nodata.dart';
import 'package:firbaseproject/widgets/myButton.dart';
import 'package:firbaseproject/widgets/progressindicater.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cartsingleitem.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartProvider cartprovider = CartProvider();
  WishlistProvider wishlistprovider = WishlistProvider();

  @override
  Widget build(BuildContext context) {
    cartprovider = Provider.of<CartProvider>(context);
    cartprovider.getcartdata();
    wishlistprovider = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 10,right: 15,left: 15),
        child: mybutton(name: 'Rs.${cartprovider.gettotalPrice()} Pay',
        ontap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentScreen()));
        }),
      ),


        backgroundColor: Appcolor.cardcolor,
      body: cartprovider.getFinallist.isEmpty
          ? nodata()
          : ListView.builder(
              itemCount: cartprovider.getFinallist.length,
              itemBuilder: (context, index) {
                CartModel data = cartprovider.getFinallist[index];
                return cartsingleitem(
                  name: data.name,
                  price: data.price,
                  image: data.img,
                  quntiy: data.qty.toString(),
                  show: true,
                  delete: () {
                    cartprovider.deleteCart(data.productid);
                  },
                  wishlistdelete: () {
                    wishlistprovider.AddtoWishlist(
                        data.name.toString(),
                        data.productid.toString(),
                        data.img.toString(),
                        int.parse(data.price.toString()),
                        context);
                  },
                );
              }),
    );
  }
}
