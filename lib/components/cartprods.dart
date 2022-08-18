import 'package:flutter/material.dart';

class CartProds extends StatefulWidget {
  const CartProds({Key? key}) : super(key: key);

  @override
  State<CartProds> createState() => _CartProdsState();
}

class _CartProdsState extends State<CartProds> {
  var prodInCart = [
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
        itemCount: prodInCart.length,
        itemBuilder: (context, index) {
          return SingleCartProd(
              cartName: prodInCart[index]['name'],
              cartColor: prodInCart[index]['color'],
              cartQty: prodInCart[index]['qty'],
              cartSize: prodInCart[index]['size'],
              cartPrice: prodInCart[index]['price'],
              cartPic: prodInCart[index]['pic']);
        });
  }
}

class SingleCartProd extends StatelessWidget {
  final cartName;
  final cartPic;
  final cartPrice;
  final cartSize;
  final cartColor;
  final cartQty;
  const SingleCartProd(
      {Key? key,
      this.cartName,
      this.cartPic,
      this.cartPrice,
      this.cartSize,
      this.cartColor,
      this.cartQty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        dense: true,
        leading: Image.asset(
          cartPic,
          width: 120.0,
          height: 120.0,
        ),
        title: Text(
          cartName,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartSize,
                    style: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(cartColor,
                      style: const TextStyle(color: Colors.blueGrey)),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$$cartPrice",
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(
                              color: Colors.blueGrey,
                            )),
                        child: Center(child: Text("$cartQty"))),
                    IconButton(
                      icon: const Icon(Icons.add),
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
