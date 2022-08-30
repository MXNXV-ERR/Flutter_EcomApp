import 'package:firebase_database/firebase_database.dart';

class UserServices {
  final FirebaseDatabase _db = FirebaseDatabase.instance;
  String ref = "users";
  createUsr(String? uid, Map value) {
    _db
        .ref()
        .child("$ref/$uid")
        .push()
        .set(value)
        .catchError((e) => {print(e.toString())});
  }
}
