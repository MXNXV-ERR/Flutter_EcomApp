import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:ecommerce_app/components/horizontallistview.dart';
import 'package:ecommerce_app/components/products.dart';

void main() {
  return runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget img_caruosel = new Container(
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
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("EcomApp"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
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
          physics: BouncingScrollPhysics(),
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
                  leading: Icon(Icons.home),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Account"),
                  leading: Icon(Icons.person),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My Orders"),
                  leading: Icon(Icons.shopping_bag),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Categories"),
                  leading: Icon(Icons.dashboard),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Favorites"),
                  leading: Icon(Icons.favorite),
                )),
            const Divider(),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Settings"),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey,
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
                ))
          ],
        ),
      ),
      body: ListView(
        children: [
          img_caruosel,
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Categories"),
          ),
          const HorizontalList(),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text("Recent products"),
          ),
          Container(
            height: 350.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}
