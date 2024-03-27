import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductTileContent extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  ProductTileContent(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 190, 190, 190)),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // margin: EdgeInsets.all(5),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(image),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  padding: EdgeInsets.only(bottom: 16.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
