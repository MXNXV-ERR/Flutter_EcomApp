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
                onPressed: null,
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
                onPressed: null,
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
                onPressed: null,
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
        ],
      ),
    );
  }
}
