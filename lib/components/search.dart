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

          for (var products in searchTerms!) {
            if (products.toLowerCase().contains(query.toLowerCase())) {
              matchQuery.add(products);
            }
          }
          return ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: ((context, index) {
                var result = matchQuery[index];
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
                return ListTile(
                  title: Text(result),
                  // onTap: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => null)//ProductDetails(user: user,),
                  //   ));
                  // },
                );
              }));
        }
      },
    );
  }

  // List<String> getProdDetails(String result) {
  //   final snapshot = fbfsi.collection("ecom").get();
  //   List<String> prodDetails;
  //   res.then((value) => {
  //     prodDetails.add(snapshot.)
  //   })
  // }
}
