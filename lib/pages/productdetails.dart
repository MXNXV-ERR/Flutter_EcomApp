import 'package:ecommerce_app/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/components/products.dart';

import '../components/search.dart';

class ProductDetails extends StatefulWidget {
  final User? user;
  final dynamic name;
  final dynamic pic;
  final dynamic oprice;
  final dynamic price;
  final dynamic details;
  const ProductDetails(
      {Key? key,
      required this.name,
      required this.pic,
      required this.oprice,
      required this.price,
      required this.details,
      required this.user})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            user: widget.user,
                          )));
            },
            child: const Text("EcomApp")),
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
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300.0,
            child: GridTile(
              footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                            child: Text("\$${widget.oprice}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ))),
                        Expanded(
                            child: Text(
                          "\$${widget.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ))
                      ],
                    ),
                  )),
              child: Image.network(
                widget.pic,
                fit: BoxFit.contain,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                elevation: 2.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Size"),
                          content: const Text("Choose your size"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: const [
                    Expanded(child: Text("Size")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                elevation: 2.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Color"),
                          content: const Text("Choose your color"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: const [
                    Expanded(child: Text("Color")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                elevation: 2.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Quantity"),
                          content: const Text("Choose your Quantity"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: const [
                    Expanded(child: Text("Qty")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                      elevation: 2.0,
                      onPressed: () {},
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: const Text("Buy Now"))),
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.blueGrey,
                  )),
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.blueGrey,
                  ))
            ],
          ),
          const Divider(),
          ListTile(
            title: const Text("Product details"),
            subtitle: Text(widget.details),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(children: [
              Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text(
                        "Product name",
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(widget.name),
                  )
                ],
              ),
              Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text(
                        "Product brand",
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text("Brand x")),
                ],
              ),
              Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text(
                        "Product fit",
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ))
                ],
              ),
            ]),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Similar Producs"),
          ),
          SizedBox(
            height: 360.0,
            child: SimilarProds(
              user: widget.user,
            ),
          ),
        ],
      ),
    );
  }
}

class SimilarProds extends StatefulWidget {
  const SimilarProds({Key? key, required this.user}) : super(key: key);
  final User? user;
  @override
  State<SimilarProds> createState() => _SimilarProdsState();
}

class _SimilarProdsState extends State<SimilarProds> {
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
  ];
  //late User user;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            user: widget.user,
            name: productList[index]['name'],
            pic: productList[index]['pic'],
            oprice: productList[index]['oprice'],
            price: productList[index]['price'],
            details: productList[index]['details'],
          );
        });
  }
}
