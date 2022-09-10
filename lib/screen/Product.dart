import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/Appcolor.dart';

import 'package:firbaseproject/commonn.dart';
import 'package:firbaseproject/model/productmodel.dart';
import 'package:firbaseproject/screen/productdetail.dart';

import 'package:flutter/material.dart';

/*class productCategory extends StatefulWidget {
  const productCategory({Key? key}) : super(key: key);

  @override
  _productCategoryState createState() => _productCategoryState();
}

class _productCategoryState extends State<productCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        drawer: common.drower(context),
        appBar: AppBar(
          backgroundColor: Appcolor.button,
          title: Text('Product',style: TextStyle(fontSize: 25,color: Colors.white),),
        ),

        body: SafeArea(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('product').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemBuilder: (context, int i) {
                  var data = snapshot.data!;

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Appcolor.buttoncolor,
                            elevation: 2.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>

                                      ProductDetail(url:data.docs[i]['id'],
                                      Productm: ProductModel(
                                          detail:data.docs[i]['detail'],
                                          category:data.docs[i]['category'],
                                        code: data.docs[i]['code'],
                                        name: data.docs[i]['name'],
                                        price: data.docs[i]['price'],
                                        url: data.docs[i]['url'],
                                        id: data.docs[i]['id']

                                      ),

                                      )));
                                },
                                child: Container(

                                  height: 200,
                                    width: double.infinity,
                                    child: Column(
                                      children: [

                                        Image.network('${data.docs[i]['url']}',
                                        width: 200,
                                        height: 150,
                                        fit: BoxFit.fill,),
                                        SizedBox(height: 10,),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                ' ${snapshot.data!.docs[i]['name'].toString().toUpperCase()}'
                                            ,style: Appcolor.textsyle,),
                                            Text('Rs. ${data.docs[i]['price'].toString()}',style: Appcolor.textsyle,),
                                          ],
                                        )
                                      ],
                                    )
                                ),
                              ),
                            )),
                      ),
                    ],
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );

              /*  ListView(
                children: snapshot.data!.docs.map((document) {
                  return Container(
                    child: Center(child: Text(document['name'])),
                  );
                }).toList(),
              );*/
            },
          ),
        ));
  }

}
class appbar extends StatefulWidget {
  const appbar({Key? key}) : super(key: key);

  @override
  _appbarState createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(


      title: Container(
         width: double.infinity,
        child: Column(
          children: [
            Text(
              'cart',
              style: TextStyle(
                fontSize: 30.0
              ),
            )
          ],
        ),
      ),
    );
  }
}*/
