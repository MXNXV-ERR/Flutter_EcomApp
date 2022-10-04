import 'package:ecommerce_app/components/notifiers.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce_app/components/auth.dart';
import 'package:ecommerce_app/components/formfeild.dart';
import 'package:ecommerce_app/pages/homepage.dart';
import 'package:ecommerce_app/db/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController cpwdController = TextEditingController();
  UserServices usrServ = UserServices();
  String email = "";
  String password = "";
  String name = "";
  String groupValue = "Male";
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  late RegExp regExp = RegExp(p);
  bool obsecureTxt = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: _scaffoldKey,
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.black12,
                // key: _scaffoldKey,
                // appBar: AppBar(
                //   title: const Text("Login"),
                // ),
                body: liftedBoxBuilder(
                  child: Stack(alignment: Alignment.center, children: [
                    //=================Backgroung img=====================
                    // Container(
                    //   height: double.infinity,
                    //   width: double.infinity,
                    //   // child: Image.asset(
                    //   //   'bgimg',
                    //   //   fit: BoxFit.cover,
                    //   //)
                    // ),
                    // //=======Opacity for bg img=============
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
                          padding:
                              const EdgeInsets.only(bottom: 20.0, top: 17.0),
                          child: SizedBox(
                            height: 120.0,
                            width: 120.0,
                            child: Container(
                              color: Colors.amber,
                              child: const Center(
                                  child: Image(
                                image: AssetImage("assets/imgs/logo.png"),
                              )),
                            ),
                          ),
                        ),

                        //===============Email - password signup====================
                        formBuilder(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("I already have an account! "),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Login()));
                              },
                              child: const Text(
                                "Click here",
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            const Text(" to sign in"),
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
                ))));
  }

  Future<void> validation() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final FormState? form = _formkey.currentState;
    if (form!.validate()) {
      try {
        UserCredential result =
            await Auth.createUserWithEmailandPassword(email, password);
        if (!mounted) return;
        // UserCredential result = await FirebaseAuth.instance
        //     .createUserWithEmailAndPassword(email: email, password: password);
        Map value = {
          "username": nameController.text,
          "email": result.user?.email,
          "uid": result.user?.uid,
          "gender": groupValue,
        };
        usrServ.createUsr(result.user?.uid, value);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(
                  user: result.user,
                )));
        //print(result.user!.uid);
      } on FirebaseException catch (e) {
        //print(e.message.toString());
        Notifiers.showSnackBarScaffoldLock(e.message.toString(), _scaffoldKey);
        //_showSnackBar(e.message.toString());
      }
    } else {
      //print("No");
      Notifiers.showSnackBarScaffoldLock(
          "Please wait... Processing data", _scaffoldKey);
    }
  }

  valueChanged(Object? e) {
    setState(() {
      if (e == "Male") {
        groupValue = e.toString();
      } else if (e == "Female") {
        groupValue = e.toString();
      }
    });
  }

  Widget formBuilder() {
    return Form(
      key: _formkey,
      child: Column(//direction: Axis.vertical,
          children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: TxtFrmFld(
              controller: nameController,
              onChanged: () {},
              validator: (value) {
                if (value!.length < 5) {
                  return "Please enter full name";
                }
                return null;
              },
              label: "Full Name",
              icon: Icons.person),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: TxtFrmFld(
              controller: emailController,
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
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: PwdFrmFld(
              controller: cpwdController,
              onChanged: () {},
              obsecureTxt: true,
              validator: (value) {
                if (value == null) {
                  return "This feild cannot be empty";
                } else if (pwdController.text != value) {
                  return "The passwords do not match";
                } else {
                  return null;
                }
              },
              label: "Confirm password",
              onTap: () {}),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ))),
                  child: const Text("Sign up")),
            ),
          ),
        ),
      ]),
    );
  }

  Widget liftedBoxBuilder({required Widget child}) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), child: child),
            ),
          ),
        ),
      ),
    );
  }
}
