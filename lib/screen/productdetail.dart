import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/provider/cartprovider.dart';
import 'package:firbaseproject/screen/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class productDetail extends StatefulWidget {
  String? productname;
  String? url;
  int? price;
  String? detail;
  String? productid;

  productDetail(
      {Key? key,
      this.productname,
      this.url,
      this.price,
      this.detail,
      this.productid})
      : super(key: key);

  @override
  _productDetailState createState() => _productDetailState();
}

class _productDetailState extends State<productDetail> {

  CartProvider cartprovider = CartProvider();

  int count = 1;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Appcolor.button,
        title: Text('Product Details'),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wishlidt()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Appcolor.button,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                      )),
                  height: 50,
                  width: w / 2.02,
                  child: Center(
                      child: Text(
                    'Add to wishlist',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))),
            ),
            InkWell(
              onTap: () {
                cartprovider.Addcart(
                    widget.productid.toString(),
                    widget.productname.toString(),
                    widget.url.toString(),
                    int.parse(widget.price.toString()),
                    count,
                    context);
                //Navigator.push(context,MaterialPageRoute(builder: (context)=>CartScreen()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Appcolor.button,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                      )),
                  height: 50,
                  width: w / 2.02,
                  child: Center(
                      child: Text(
                    'Go to cart',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Image.network(
                  widget.url.toString(),
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: h / 2,
                  //color: Colors.red,
                ),
              ),
              Container(
                width: w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.productname!.toUpperCase()}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Price Rs ${widget.price}',
                          style: TextStyle(fontSize: 17, color: Colors.red),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: 10, right: 5),
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                            color: Appcolor.button),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (count > 1) {
                                  setState(() {
                                    count--;
                                  });
                                } else {
                                  count = 1;
                                }
                              },
                              child: Icon(
                                Icons.remove,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '$count',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                if (count < 10) {
                                  setState(() {
                                    count++;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 5, left: 5),
                child: Text(
                  '${widget.detail}',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  //maxLines: 5,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*class ProductDetail extends StatefulWidget {
  String? url;
  ProductModel Productm;
  ProductDetail({Key? key, required this.url, required this.Productm})
      : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: common.drower(context),
      appBar: AppBar(
        title: Text('Product detail '),
        backgroundColor: Appcolor.button,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Image.network(widget.Productm.url.toString()),
            // 'https://firebasestorage.googleapis.com/v0/b/flutter-17221.appspot.com/o/images%2Fimage_picker5224007524767252787.jpg?alt=media&token=41eba031-36be-4334-b572-46e2ac90d189'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(widget.Productm.name.toString(),
                        style: TextStyle(
                          fontSize: 25.0,
                        )),
                  ),
                  const Text(
                    'Rs.15000',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                  child: Text(
                widget.Productm.detail.toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20.0),
              )),
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                child: Text('product code : ${widget.Productm.code}',
                    style: TextStyle(fontSize: 20.2))),
            Container(
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                child: Text('product category : ${widget.Productm.category}',
                    style: TextStyle(fontSize: 20.2))),

            Padding(
              padding: const EdgeInsets.only(top: 280),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    },
                    child: InkWell(
                      onTap: () {
                        cartModel
                            .addtocart(cartModel(
                                id: widget.Productm.id,
                                name: widget.Productm.name,
                                price: widget.Productm.price,
                                img: widget.Productm.url))
                            .whenComplete(() => setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('data add in cart')));

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                                }));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 160,
                          child: Text(
                            'Add to cart',
                            style: Appcolor.textsyle,
                          )),
                    ),
                    color: Appcolor.button,
                  ),
                  RaisedButton(
                    onPressed: () {
                      //ProductModel.adddata();
                    },
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>
                        CartScreen())
                        );
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 170,
                          child: Text(
                            'Wishlist',
                            style: Appcolor.textsyle,
                          )),
                    ),
                    color: Appcolor.button,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}*/
