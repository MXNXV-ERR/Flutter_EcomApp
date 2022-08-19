import 'package:flutter/material.dart';

import 'package:ecommerce_app/components/cartprods.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Cart"),
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
      body: const CartProds(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            const Expanded(
                child: ListTile(
              title: Text("Total:"),
              subtitle: Text("\$230"),
            )),
            Expanded(
                child: MaterialButton(
                    color: Colors.blueGrey,
                    onPressed: () {},
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
