import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Product 1",
      "pic": "assets/imgs.1.jpg",
      "oprice": 100,
      "price": 50,
    },
    {
      "name": "Product 1",
      "pic": "assets/imgs.1.jpg",
      "oprice": 100,
      "price": 50,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            name: product_list[index]['name'],
            pic: product_list[index]['pic'],
            oprice: product_list[index]['oprice'],
            price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final name;
  final pic;
  final oprice;
  final price;
  const Single_prod({Key? key, this.name, this.pic, this.oprice, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("test"),
    );
  }
}
