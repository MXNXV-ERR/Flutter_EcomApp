import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  final FirebaseDatabase _db = FirebaseDatabase.instance;
  String ref = "users";
  createUsr(String? uid, Map value) {
    _db
        .ref()
        .child(ref)
        .push()
        .set(value)
        .catchError((e) => {print(e.toString())});
  }
}
