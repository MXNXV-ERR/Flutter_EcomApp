import 'package:ecommerce_app/db/user.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerce_app/components/notifiers.dart';

class Auth {
  static Future<User?> signinWithGoogle({
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    //for web
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        //print(e);
        Notifiers.showSnackBar(context, e.toString());
      }
    } else {
      //for android and ios
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            Notifiers.showSnackBar(context, 'Account already exists');
            // ScaffoldMessenger.of(context).showSnackBar(
            //     Auth.customSnackBAr(content: ));
          } else if (e.code == 'invalid-credential') {
            Notifiers.showSnackBar(context, 'Invalid credentials.Try again...');
            // ScaffoldMessenger.of(context).showSnackBar(Auth.customSnackBAr(
            //     content: ));
          }
        } catch (e) {
          Notifiers.showSnackBar(
              context, 'Error occured using Google Sign-in.Try again...');
          // ScaffoldMessenger.of(context).showSnackBar(Auth.customSnackBAr(
          //     content: ));
        }
      }
    }

    return user;
  }

  // static SnackBar customSnackBAr({required String content}) {
  //   return SnackBar(
  //       backgroundColor: Colors.black,
  //       content: Text(
  //         content,
  //         style: const TextStyle(color: Colors.redAccent),
  //       ));
  // }

  static Future<FirebaseApp?> initializeFirebase(
      {required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(
                user: user,
              )));
    }

    return firebaseApp;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Notifiers.showSnackBar(context, 'Error Signing out.Try Again...');
      // ScaffoldMessenger.of(context).showSnackBar(
      //     Auth.customSnackBAr(content: ));
    }
  }

  static Future<UserCredential> createUserWithEmailandPassword(
      String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result;
  }
}

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
  String groupValue = "Male";
  valueChanged(Object? e) {
    setState(() {
      if (e == "Male") {
        groupValue = e.toString();
      } else if (e == "Female") {
        groupValue = e.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: _isSigningIn
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              )
            : SizedBox(
                height: 75.0,
                width: 75.0,
                child: IconButton(
                    onPressed: () async {
                      setState(() {
                        _isSigningIn = true;
                      });
                      User? user =
                          await Auth.signinWithGoogle(context: context);
                      UserServices userServices = UserServices();
                      Map value = {
                        "username": user?.displayName,
                        "email": user?.email,
                        "uid": user?.uid,
                        "gender": await getGender(),
                      };
                      userServices.createUsr(user!.uid, value);
                      setState(() {
                        _isSigningIn = false;
                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomePage(
                                user: user,
                              )));
                    },
                    icon: Image.asset(
                      'assets/imgs/Google.png',
                      fit: BoxFit.fill,
                    ))));
  }

  Future<String> getGender() async {
    String groupValue = "Male";
    AlertDialog(
      title: const Text("Gender"),
      actions: [
        Radio(
            value: "Male",
            groupValue: groupValue,
            onChanged: (e) => valueChanged(e)),
        const Text("Male    "),
        Radio(
            value: "Female",
            groupValue: groupValue,
            onChanged: (e) => valueChanged(e)),
        const Text("Female"),
      ],
    );
    return groupValue;
  }
}
