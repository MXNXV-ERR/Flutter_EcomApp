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
      "quantity": 1,
    },
    {
      "name": "Product 2",
      "pic": "assets/imgs/1.jpg",
      "price": 50,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
      title: Text(
        cart_name,
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text("Size:")),
              Expanded(child: Text("Color:"))
            ],
          )
        ],
      ),
    ));
  }
}
