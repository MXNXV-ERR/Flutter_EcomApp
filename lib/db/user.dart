import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  final FirebaseDatabase _db = FirebaseDatabase.instance;
  final fbfsi = FirebaseFirestore.instance;

  String ref = "users";
  createUsr(String? uid, Map value) {
    _db
        .ref()
        .child("$ref/$uid")
        .push()
        .set(value)
        .catchError((e) => {print(e.toString())});
  }

  // Future<List<dynamic>> getProdsList() async {
  //   QuerySnapshot querySnapshot = await fbfsi.collection("ecom").get();
  //   final prodList = querySnapshot.docs.map((doc) => doc.get("name")).toList();
  //   print(prodList);
  //   return prodList;
  // }
}
