import 'package:ecommerce/Home.dart/component/produk_card.dart';
import 'package:ecommerce/Home.dart/component/search.dart';
import 'package:ecommerce/api.dart';
import 'package:ecommerce/controller/produk_controller.dart';
import 'package:ecommerce/decoration.dart';
import 'package:ecommerce/pages/detail_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyAllProduk extends StatelessWidget {
  MyAllProduk({super.key});
  final ProdukController myController = Get.find<ProdukController>();

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
      body: Obx(
        () {
          if (myController.allProduk.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: GridView.count(
                crossAxisSpacing: 2.0,
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.5,
                children: List.generate(
                  myController.allProduk.length,
                  (index) => InkWell(
                    onTap: () {
                      Get.to(
                        () => DetailPages(
                          dataModel: myController.allProduk[index],
                        ),
                      );
                    },
                    child: ProdukCard(
                        image: API.storageImage +
                            myController.allProduk[index].gambar,
                        nama: myController.allProduk[index].namaBarang,
                        harga: myController.allProduk[index].harga),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
