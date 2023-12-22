import 'package:ecommerce/Home.dart/component/casback.dart';
import 'package:ecommerce/Home.dart/component/search.dart';
import 'package:ecommerce/Home.dart/component/section_title.dart';
import 'package:ecommerce/Home.dart/component/pageview.dart';
import 'package:ecommerce/Home.dart/widget/kategori_kaos.dart';
import 'package:ecommerce/Home.dart/widget/kategori_sepatu.dart';
import 'package:ecommerce/decoration.dart';
import 'package:ecommerce/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const SearchField(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            "assets/icons/Cart Icon.svg",
          ),
        ),
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyPageView(),
                SizedBox(height: Dimensions.height10),
                const BannerCashback(),
                SectionTitle(title: "Kaos", onPressed: () {}),
                const CategoryKaos(),
                SectionTitle(title: 'Sepatu', onPressed: () {}),
                const CategorySepatu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
