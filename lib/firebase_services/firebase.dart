

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseServices {

  var ui;
  Future<String?> CreateAccount(String email,String password) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password).then((value) {
            ui= value.user!.uid;
            print('${ui}-------------------------');
      } );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

}

