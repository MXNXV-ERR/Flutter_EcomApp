import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ecommerce_app/pages/cart.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/horizontallistview.dart';
import '../components/products.dart';
import 'package:ecommerce_app/components/auth.dart';
import 'package:ecommerce_app/components/search.dart';

final List<String> imgList = ['assets/imgs/1.jpg', 'assets/imgs/2.jpg'];

class HomePage extends StatefulWidget {
  final User? user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Reference ref = FirebaseStorage.instance.ref().child("featured");
  //final list = ref.listAll();

  @override
  Widget build(BuildContext context) {
    Widget imgCaruosel = SizedBox(
      height: 250,
      child: CarouselSlider(
          items: imgList
              .map((item) => Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
                    child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: double.infinity))),
                  ))
              .toList(),
          options: CarouselOptions(
              autoPlay: true, enlargeCenterPage: true, aspectRatio: 2.0)),
    );

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text("EcomApp"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: CustomSearchBar(widget.user));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Cart(
                            user: widget.user,
                          )));
                },
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
              ))
        ],
      ),
      drawer: Drawer(
          //backgroundColor: Colors.blueGrey,
          child: drawerListViewBuilder()),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: imgCaruosel),
            Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            const HorizontalList(),
            Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Recent products",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
          ])),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            delegate: SliverChildListDelegate([Products(user: widget.user)]),
          )
        ],
      ),
    );
  }

  Widget drawerListViewBuilder() {
    return ListView(
      //shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(widget.user?.displayName ?? "Guest"),
          accountEmail: Text(widget.user?.email ?? "????"),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Image(
                  image: NetworkImage(widget.user?.photoURL ??
                      "https://drive.google.com/file/d/1hyCMOYVMDEf4PYsIi40W0nkEON-YaLPG/view?usp=sharing")),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10.0)),
        ),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home, color: Colors.blueGrey),
            )),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("My Account"),
              leading: Icon(Icons.person, color: Colors.blueGrey),
            )),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("My Orders"),
              leading: Icon(Icons.shopping_bag, color: Colors.blueGrey),
            )),
        InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cart(
                        user: widget.user,
                      )));
            },
            child: const ListTile(
              title: Text("Shopping Cart"),
              leading: Icon(Icons.shopping_cart, color: Colors.blueGrey),
            )),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text(
                "Favorites",
              ),
              leading: Icon(Icons.favorite, color: Colors.blueGrey),
            )),
        const Divider(),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("Settings"),
              leading: Icon(
                Icons.settings,
                color: Colors.blueAccent,
              ),
            )),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("About"),
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
            )),
        InkWell(
            onTap: ([bool mounted = true]) async {
              await Auth.signOut(context: context);
              if (!mounted) return;
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const ListTile(
              title: Text("Sign Out"),
              leading: Icon(
                Icons.logout,
                color: Colors.redAccent,
              ),
            ))
      ],
    );
  }
}
