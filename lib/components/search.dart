import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/pages/productdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends SearchDelegate {
  final User? user;
  CustomSearchBar(
    this.user,
  );
  FirebaseFirestore fbfsi = FirebaseFirestore.instance;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    return StreamBuilder(
      stream: fbfsi.collection("ecom").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final searchTerms =
              snapshot.data?.docs.map((e) => e.get("name")).toList();
          final fullDetails =
              snapshot.data?.docs.map((e) => e.get("name")).toList();
          print(fullDetails);
          for (var products in searchTerms!) {
            if (products.toLowerCase().contains(query.toLowerCase())) {
              matchQuery.add(products);
            }
          }

          return ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: ((context, index) {
                var result = matchQuery[index];
                //var details = getProdDetails();
                return ListTile(
                  title: Text(result),
                  // onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => ProductDetails(user: user),
                  //   ));
                  // },
                );
              }));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    return StreamBuilder(
      stream: fbfsi.collection("ecom").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final searchTerms =
              snapshot.data?.docs.map((e) => e.get("name")).toList();
          print(searchTerms);

          for (var products in searchTerms!) {
            if (products.toLowerCase().contains(query.toLowerCase())) {
              matchQuery.add(products);
            }
          }
          //return Text("Ready");
          return ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: ((context, index) {
                var result = matchQuery[index];
                final snapObj =
                    snapshot.data?.docs.map((e) => e.data()).toList();

                return ListTile(
                  title: Text(result),
                  onTap: () {
                    final singleProdFB =
                        snapObj![index] as Map<String, dynamic>;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        user: user,
                        name: singleProdFB['name'],
                        details: singleProdFB['details'],
                        oprice: singleProdFB['oprice'],
                        pic: singleProdFB['pic'],
                        price: singleProdFB['price'],
                      ),
                    ));
                  },
                );
              }));
        }
      },
    );
  }
}
