// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
//above is not null should be replaced with something null safe

import 'package:ecommerce_app/pages/cart.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/horizontallistview.dart';
import '../components/products.dart';
import 'package:ecommerce_app/components/auth.dart';

class HomePage extends StatefulWidget {
  final User? user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imgCaruosel = SizedBox(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: const [
          AssetImage('assets/imgs/1.jpg'),
          AssetImage('assets/imgs/2.jpg')
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: const Duration(milliseconds: 1000),
        dotSize: 2.0,
        dotColor: Colors.blueGrey,
        indicatorBgPadding: 1.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("EcomApp"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: const Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
          )
        ],
      ),
      drawer: Drawer(
        //backgroundColor: Colors.blueGrey,
        child: ListView(
          //shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.user?.displayName ?? "????"),
              accountEmail: Text(widget.user?.email ?? "????"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Image(
                      image: NetworkImage(widget.user?.photoURL ??
                          "https://drive.google.com/file/d/1hyCMOYVMDEf4PYsIi40W0nkEON-YaLPG/view?usp=sharing")),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Home Page"),
                  leading: Icon(Icons.home, color: Colors.blueGrey),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Account"),
                  leading: Icon(Icons.person, color: Colors.blueGrey),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Orders"),
                  leading: Icon(Icons.shopping_bag, color: Colors.blueGrey),
                )),
            InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Cart()));
                },
                child: ListTile(
                  title: Text("Shopping Cart"),
                  leading: Icon(Icons.shopping_cart, color: Colors.blueGrey),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    "Favorites",
                  ),
                  leading: Icon(Icons.favorite, color: Colors.blueGrey),
                )),
            const Divider(),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Settings"),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blueAccent,
                  ),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(
                    Icons.help,
                    color: Colors.blue,
                  ),
                )),
            InkWell(
                onTap: () async {
                  await Auth.signOut(context: context);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: ListTile(
                  title: Text("Sign Out"),
                  leading: Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                  ),
                ))
          ],
        ),
      ),
      body: Column(
        children: [
          imgCaruosel,
          Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Categories"),
              )),
          const HorizontalList(),
          Container(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Recent products"),
              )),
          Flexible(
            child: Products(
              user: widget.user,
            ),
          )
        ],
      ),
    );
  }
}
