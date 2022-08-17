import 'package:flutter/material.dart';

class CartProds extends StatefulWidget {
  const CartProds({Key? key}) : super(key: key);

  @override
  State<CartProds> createState() => _CartProdsState();
}

class _CartProdsState extends State<CartProds> {
  var Prod_in_cart = [
    {
      "name": "Product 1",
      "pic": "assets/imgs/1.jpg",
      "price": 50,
      "size": "M",
      "color": "Red",
      "qty": "1",
    },
    {
      "name": "Product 2",
      "pic": "assets/imgs/1.jpg",
      "price": 50,
      "size": "M",
      "color": "Red",
      "qty": 1,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 150.0,
        itemCount: Prod_in_cart.length,
        itemBuilder: (context, index) {
          return SingleCartProd(
              cart_name: Prod_in_cart[index]['name'],
              cart_color: Prod_in_cart[index]['color'],
              cart_qty: Prod_in_cart[index]['qty'],
              cart_size: Prod_in_cart[index]['size'],
              cart_price: Prod_in_cart[index]['price'],
              cart_pic: Prod_in_cart[index]['pic']);
        });
  }
}

class SingleCartProd extends StatelessWidget {
  final cart_name;
  final cart_pic;
  final cart_price;
  final cart_size;
  final cart_color;
  final cart_qty;
  const SingleCartProd(
      {Key? key,
      this.cart_name,
      this.cart_pic,
      this.cart_price,
      this.cart_size,
      this.cart_color,
      this.cart_qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        dense: true,
        leading: Image.asset(
          cart_pic,
          width: 120.0,
          height: 120.0,
        ),
        title: Text(
          cart_name,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cart_size,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cart_color,
                      style: TextStyle(color: Colors.blueGrey)),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$${cart_price}",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(
                              color: Colors.blueGrey,
                            )),
                        child: Center(child: Text("${cart_qty}"))),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
