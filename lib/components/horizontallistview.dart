import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Category(imageLoc: "assets/imgs/1.jpg", imgCc: "CAT 1"),
          Category(imageLoc: "assets/imgs/1.jpg", imgCc: "CAT 2"),
          Category(imageLoc: "assets/imgs/1.jpg", imgCc: "CAT 3"),
          Category(imageLoc: "assets/imgs/1.jpg", imgCc: "CAT 4"),
          Category(imageLoc: "assets/imgs/1.jpg", imgCc: "CAT 5"),
          Category(imageLoc: "assets/imgs/1.jpg", imgCc: "CAT 6")
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({Key? key, required this.imageLoc, required this.imgCc})
      : super(key: key);
  final String imageLoc;
  final String imgCc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: null,
        child: Container(
          width: 90.0,
          height: 200.0,
          child: ListTile(
            title: Image.asset(
              imageLoc,
            ),
            subtitle:
                Container(alignment: Alignment.topCenter, child: Text(imgCc)),
          ),
        ),
      ),
    );
  }
}
