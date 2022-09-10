import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbaseproject/Appcolor.dart';
import 'package:firbaseproject/screen/Product.dart';
import 'package:firbaseproject/model/productmodel.dart';
import 'package:firbaseproject/screen/splasScreen.dart';
import 'package:firbaseproject/widgets/myButton.dart';
import 'package:firbaseproject/widgets/progressindicater.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:uuid/uuid.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController pname = new TextEditingController();
  TextEditingController pprice = new TextEditingController();
  TextEditingController pcode = new TextEditingController();
  TextEditingController pdetail = new TextEditingController();
  TextEditingController pcategory = new TextEditingController();
  var Id = Uuid();
  //

  bool uploading = false;
  double val = 0;
  CollectionReference? imgRef;
  //fifirebase_storage.Reference ref;
  Reference? ref;

  List<File> _image = [];
  final picker = ImagePicker();

//
  final formkey = GlobalKey<FormState>();
  String? selectedvalue = '';
  var items = [
    'Electric',
    'Grocery',
    'Education product',
    'Froots',
    'Other Product'
  ];
  final imagepicker = ImagePicker();
  bool islodin = false;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add product data',
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
        backgroundColor: Appcolor.button,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                islodin == true
                    ? myprogressindicater()
                    : Padding(
                        padding: const EdgeInsets.all(0.0),
                       /* child: DropdownButtonFormField(
                          hint: Text("select value"),
                          value: 'selecet',
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedvalue = newValue.toString();
                            });
                          },
                        ),*/
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: pname,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter email id";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter Product Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: pdetail,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter Product price";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Product Detail',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: pcode,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter password id";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Product Code',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: pprice,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter password id";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Product Price',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: mybutton(
                    name: 'Select Image',
                    ontap: () async {
                      chooseImage();

                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>createnewuser()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1),
                        color: Appcolor.cardcolor),
                    child: GridView.builder(
                      itemCount: _image.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context, int i) {
                        return i == null
                            ? Text('no image')
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Image.file(File(_image[i].path),
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.fill),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _image.removeAt(i);
                                          });
                                          print(
                                              "===============================");
                                        },
                                        icon: Icon(
                                          Icons.cancel_outlined,
                                        ))
                                  ],
                                ));

                        //singleimage!= null && singleimage!.path.isNotEmpty
                        // ?Image.file(File(singleimage!.path),
                        //height: 150,
                        //  ):Text('no image');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: mybutton(
                      name: 'Save Data ',
                      ontap: () {
                        Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (_)=>splasscreen()));
                        setState(() {
                          islodin = true;
                        });

                        uploadFile();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile?.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });

      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref!.putFile(img).whenComplete(() async {
        await ref!.getDownloadURL().then((value) {
          ProductModel.adddata(ProductModel(
              category: selectedvalue,
              code: pcode.text,
              detail: pdetail.text,
              id: Id.v4(),
              name: pname.text,
              price: int.parse(pprice.text),
              url: value));
          setState(() {
            islodin = false;
          });
          pcode.clear();
          pdetail.clear();
          pname.clear();
          pprice.clear();
          pdetail.clear();
          _image.clear();

          // imgRef!.add({'url': value,'category':selectedvalue,'id':Id.v4(),
          // 'name':pname.text,'detail':pdetail.text,'code':pcode.text,'price':pprice.text});
          i++;
          // Navigator.push(
          //   context, MaterialPageRoute(builder: (context) =>productCategory()));
        });
      });
    }
  }
  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('product');
  }
}
