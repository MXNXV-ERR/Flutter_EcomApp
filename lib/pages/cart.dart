import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/components/cartprods.dart';

import '../components/search.dart';

class Cart extends StatefulWidget {
  final User? user;
  const Cart({Key? key, required this.user}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text("Cart"),
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
