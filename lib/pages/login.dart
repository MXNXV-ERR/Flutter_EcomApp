import 'package:ecommerce_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences prefs;
  late bool loading;
  bool isLoggedin = false;

  @override
  void initState() {
    super.initState();
    //isSignedin();
  }

  // Future handleSignin() async {
  //  prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     loading = true;
  //   });

  //   GoogleSignInAccount? gUser = await googleSignIn.signIn();
  //   GoogleSignInAuthentication? googleSignInAuthentication =
  //       await gUser?.authentication;
  //   final firebaseCred = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication?.accessToken,
  //       idToken: googleSignInAuthentication?.idToken);
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(firebaseCred);
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (firebaseCred != null) {
  //     final QuerySnapshot result = await FirebaseFirestore.instance
  //         .collection("users")
  //         .where("id", isEqualTo: user?.uid)
  //         .get();
  //     final List<DocumentSnapshot> documents = result.docs;
  //     if (documents.length == 0) {
  //       FirebaseFirestore.instance
  //           .collection("users")
  //           .doc(FirebaseAuth.instance.currentUser?.uid)
  //           .set({
  //         "id": user?.uid,
  //         "profilePic": user?.photoURL,
  //       });
  //       await prefs.setString("id", user?.uid ?? "0");
  //       await prefs.setString("displayname", user?.displayName ?? "0");
  //       await prefs.setString("photoUrl", user?.photoURL ?? "0");
  //     } else {
  //       await prefs.setString("id", documents[0]['id']);
  //       await prefs.setString("displayname", documents[0]['username']);
  //       await prefs.setString("photoUrl", documents[0]['photoUrl']);
  //     }
  //     Fluttertoast.showToast(msg: "Log in was successful");
  //     setState(() {
  //       loading = false;
  //     });
  //   } else {}
  // }

  // void isSignedin() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   prefs = await SharedPreferences.getInstance();
  //   isLoggedin = await googleSignIn.isSignedIn();
  //   if (isLoggedin) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Text("hello"),
      ),
    );
  }
}
