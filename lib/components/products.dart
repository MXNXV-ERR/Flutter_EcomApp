import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/pages/productdetails.dart';

class Products extends StatefulWidget {
  final User? user;
  const Products({Key? key, required this.user}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Product 1",
      "pic": "assets/imgs/1.jpg",
      "oprice": 100,
      "price": 50,
      "details": "",
    },
    {
      "name": "Product 2",
      "pic": "assets/imgs/1.jpg",
      "oprice": 100,
      "price": 50,
      "details": "",
    },
    {
      "name": "Product 3",
      "pic": "assets/imgs/2.jpg",
      "oprice": 100,
      "price": 50,
      "details": "",
    },
    {
      "name": "Product 4",
      "pic": "assets/imgs/1.jpg",
      "oprice": 100,
      "price": 50,
      "details": "",
    },
    {
      "name": "Product 5",
      "pic": "assets/imgs/2.jpg",
      "oprice": 100,
      "price": 50,
      "details": "",
    },
    {
      "name": "Product 6",
      "pic": "assets/imgs/2.jpg",
      "oprice": 100,
      "price": 50,
      "details": "",
    },
    {
      "name": "Product 7",
      "pic": "assets/imgs/2.jpg",
      "oprice": 100,
      "price": 50,
      "details": "",
    },
    {
      "name": "Product 8",
      "pic": "assets/imgs/2.jpg",
      "oprice": 100,
      "price": 50,
      "details": "",
    },
  ];
  //late User user;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemCount: productList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleProd(
              name: productList[index]['name'],
              pic: productList[index]['pic'],
              oprice: productList[index]['oprice'],
              price: productList[index]['price'],
              details: productList[index]['details'],
              user: widget.user,
            ),
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final dynamic name;
  final dynamic pic;
  final dynamic oprice;
  final dynamic price;
  final dynamic details;
  final User? user;
  const SingleProd(
      {Key? key,
      required this.name,
      required this.pic,
      required this.oprice,
      required this.price,
      required this.details,
      required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]),
            child: Card(
              child: Hero(
                  tag: name,
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => ProductDetails(
                                user: user,
                                name: name,
                                price: price,
                                oprice: oprice,
                                pic: pic,
                                details: details,
                              )))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: GridTile(
                          footer: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              )
                            ]),
                            //color: Colors.black12,
                            child: ListTile(
                              leading: Text(
                                name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(
                                "\$$price",
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800),
                              ),
                              subtitle: Text(
                                "\$$oprice",
                                style: const TextStyle(
                                    decorationThickness: 3.0,
                                    decoration: TextDecoration.lineThrough,
                                    color: Color.fromARGB(255, 119, 118, 118),
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          child: Image.asset(
                            pic,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )),
            )));
  }
}
