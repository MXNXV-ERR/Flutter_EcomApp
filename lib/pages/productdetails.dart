import 'package:flutter/material.dart';

class Product_Details extends StatefulWidget {
  final name;
  final pic;
  final oprice;
  final price;
  const Product_Details(
      {Key? key, this.name, this.pic, this.oprice, this.price})
      : super(key: key);

  @override
  State<Product_Details> createState() => _Product_DetailsState();
}

class _Product_DetailsState extends State<Product_Details> {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          Container(
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.pic),
              ),
              footer: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: null,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
