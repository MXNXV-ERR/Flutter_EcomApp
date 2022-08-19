import 'dart:html';

import 'package:ecommerce_app/pages/homepage.dart';
import 'package:ecommerce_app/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/components/auth.dart';
import 'package:ecommerce_app/components/formfeild.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  //late final ScaffoldMessengerState? _scaffold = _scaffoldKey.currentState;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController pwdController = TextEditingController();

  String email = "";
  String password = "";
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  late RegExp regExp = RegExp(p);
  bool obsecureTxt = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black45,
        // appBar: AppBar(
        //   title: const Text("Login"),
        // ),
        body: Center(
          child: Stack(children: [
            //=================Backgroung img=====================

            //TODO::add bg img

            Container(
              height: double.infinity,
              width: double.infinity,
              // child: Image.asset(
              //   'bgimg',
              //   fit: BoxFit.cover,
              // )
            ),
            //=======Opacity for bg img=============
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //===============================Logo Holder=====================
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    height: 120.0,
                    width: 120.0,
                    child: Container(
                      color: Colors.amber,
                      child: Center(child: Text("Logo holder")),
                    ),
                  ),
                ),
                //===============Email - password login====================
                Form(
                  //sdfgautovalidateMode: AutovalidateMode.onUserInteraction,
                  //autovalidateMode: AutovalidateMode.always,
                  key: _formkey,
                  child: Column(//direction: Axis.vertical,
                      children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: TxtFrmFld(
                          icon: Icons.email,
                          onChanged: (value) {
                            validation();
                            email = value;
                            setState(() {
                              validation();
                              email = value.toString().trim();
                              //print("this" + email);
                            });
                          },
                          validator: (value) {
                            if (value == "") {
                              return "Please fill the email";
                            } else if (!regExp.hasMatch(value!)) {
                              return "Email is Invalid";
                            }
                            setState(() {
                              email = value.toString().trim();
                            });
                            return null;
                          },
                          label: "Email"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: PwdFrmFld(
                        controller: pwdController,
                        onChanged: (value) {
                          setState(() {
                            validation();
                            password = value;
                          });
                        },
                        obsecureTxt: true,
                        validator: (value) {
                          if (value == "") {
                            return 'Please enter the password';
                          } else if (value!.length < 8) {
                            return "Password too short";
                          }
                          setState(() {
                            password = value.toString().trim();
                          });
                          return null;
                        },
                        label: 'Password',
                        onTap: () {
                          setState(() {
                            obsecureTxt = !obsecureTxt;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SizedBox(
                        width: 300,
                        height: 65,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: ElevatedButton(
                              onPressed: validation,
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ))),
                              child: const Text("Login")),
                        ),
                      ),
                    )
                  ]),
                ),
                //sign up options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don`t have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        "Click here",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const Text(" to sign up"),
                  ],
                ),

                const Divider(),
                //==============other sign in options====================
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Other Sign-in Options",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                //Google Sign in
                FutureBuilder(
                  future: Auth.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error initializing firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return const GoogleSignInButton();
                    }

                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.orangeAccent,
                      ),
                    );
                  },
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> validation() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final FormState? _form = _formkey.currentState;
    if (_form!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        print(result.user!.uid);
        if (result.user != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(
                    user: result.user,
                  )));
        }
      } on FirebaseException catch (e) {
        print(e);

        _showSnackBar(e.message.toString());
      }
    } else {
      print("No");

      _showSnackBar("Please wait... Processing data");
    }
  }

  void _showSnackBar(String content) {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(content)));
  }
}

void showbanner(dynamic context) =>
    ScaffoldMessenger.of(context).showMaterialBanner(
        const MaterialBanner(content: Text("hell"), actions: []));

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5.0),
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
                      setState(() {
                        _isSigningIn = false;
                      });
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage(
                                  user: user,
                                )));
                      }
                    },
                    icon: Image.asset(
                      'assets/imgs/Google.png',
                      fit: BoxFit.fill,
                    ))));
  }
}
