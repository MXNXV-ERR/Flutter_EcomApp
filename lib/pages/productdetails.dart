import 'package:ecommerce_app/pages/homepage.dart';
import 'package:flutter/material.dart';
//import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/components/products.dart';

class Product_Details extends StatefulWidget {
  final name;
  final pic;
  final oprice;
  final price;
  final details;
  const Product_Details(
      {Key? key, this.name, this.pic, this.oprice, this.price, this.details})
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
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: const Text("EcomApp")),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                //color: Colors.white,
                child: Image.asset(widget.pic),
              ),
              footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                            child: Text("\$${widget.oprice}",
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ))),
                        Expanded(
                            child: Text(
                          "\$${widget.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ))
                      ],
                    ),
                  )),
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
                          title: Text("Size"),
                          content: Text("Choose your size"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: [
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
                          title: Text("Color"),
                          content: Text("Choose your color"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: [
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
                          title: Text("Quantity"),
                          content: Text("Choose your Quantity"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: [
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
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                      child: new Text("Buy Now"))),
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
            title: Text("Product details"),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"),
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                    "Product name",
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(widget.name),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                    "Product brand",
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 12.0), child: Text("Brand x")),
            ],
          ),
          Row(
            children: [
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
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Similar Producs"),
          ),
          Container(
            height: 360.0,
            child: Similar_Prods(),
          ),
        ],
      ),
    );
  }
}

class Similar_Prods extends StatefulWidget {
  const Similar_Prods({Key? key}) : super(key: key);

  @override
  State<Similar_Prods> createState() => _Similar_ProdsState();
}

class _Similar_ProdsState extends State<Similar_Prods> {
  var product_list = [
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
            details: product_list[index]['details'],
          );
        });
  }
}
