//import 'package:ecommerce_app/firebase_options.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  return runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}
