import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce_app/pages/cart.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:flutter/material.dart';

import '../components/horizontallistview.dart';
import '../components/products.dart';
import 'package:ecommerce_app/components/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imgCaruosel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/imgs/1.jpg'),
          AssetImage('assets/imgs/2.jpg')
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
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
              accountName: Text("temp"),
              accountEmail: Text("Temp@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.person),
                ),
              ),
              decoration: BoxDecoration(
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
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Recent products"),
              )),
          Flexible(
            child: Products(),
          )
        ],
      ),
    );
  }
}
