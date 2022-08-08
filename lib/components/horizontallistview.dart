import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(image_loc: "assets/imgs/1.jpg", img_cc: "CAT 1"),
          Category(image_loc: "assets/imgs/1.jpg", img_cc: "CAT 2"),
          Category(image_loc: "assets/imgs/1.jpg", img_cc: "CAT 3"),
          Category(image_loc: "assets/imgs/1.jpg", img_cc: "CAT 4"),
          Category(image_loc: "assets/imgs/1.jpg", img_cc: "CAT 5"),
          Category(image_loc: "assets/imgs/1.jpg", img_cc: "CAT 6")
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({Key? key, required this.image_loc, required this.img_cc})
      : super(key: key);
  final String image_loc;
  final String img_cc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: null,
        child: Container(
          width: 90.0,
          height: 200.0,
          child: ListTile(
            title: Image.asset(
              image_loc,
            ),
            subtitle:
                Container(alignment: Alignment.topCenter, child: Text(img_cc)),
          ),
        ),
      ),
    );
  }
}
