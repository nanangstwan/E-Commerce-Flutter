import 'package:ecommerce/dimensions.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../decoration.dart';

class DeskripsiProduk extends StatelessWidget {
  const DeskripsiProduk(
      {Key? key,
      required this.titleProduk,
      required this.price,
      this.deskripsi = ''})
      : super(key: key);

  final String titleProduk, price, deskripsi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleProduk,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: Dimensions.height10),
          Text(
            'RP.$price',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: Dimensions.height20),
          ExpandableText(
            deskripsi,
            expandText: 'Show More',
            collapseText: 'Show Less',
            maxLines: 3,
            linkColor: kPrimaryColor,
          ),

          SizedBox(height: Dimensions.height20),
          // GestureDetector(
          //   onTap: () {},
          //   child: const Row(
          //     children: [
          //       Text(
          //         "See More Detail",
          //         style: TextStyle(
          //             fontWeight: FontWeight.w600, color: kPrimaryColor),
          //       ),
          //       SizedBox(width: 5),
          //       Icon(
          //         Icons.arrow_forward_ios,
          //         size: 12,
          //         color: kPrimaryColor,
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
