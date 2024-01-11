import 'package:ecommerce/api.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/decoration.dart';
import 'package:ecommerce/dimensions.dart';
import 'package:ecommerce/dummy_data.dart';
import 'package:ecommerce/pages/container.dart';
import 'package:ecommerce/pages/produk_deskripsi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DetailPages extends StatelessWidget {
  const DetailPages({
    Key? key,
    required this.dataModel,
  }) : super(key: key);
  final ProdukList dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: 238,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(API.storageImage + dataModel.gambar),
            ),
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                DeskripsiProduk(
                  titleProduk: dataModel.namaBarang,
                  price: dataModel.harga,
                  deskripsi: dataModel.deskripsi?? 'Belum ada Deskripsi',
                )
              ],
            ),
          ),
          // OptionsPage()
        ],
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                SizedBox(
                  width: Dimensions.containerWidth,
                  child: ElevatedButton(
                      onPressed: () {
                        bottomSheet();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/Cart Icon.svg",
                        color: Colors.white,
                      )),
                ),
                SizedBox(width: Dimensions.height10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Beli Sekarang"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void bottomSheet() {
    final quantityController = Get.put(CartController());
    final price = int.parse(dataModel.harga);
    final pricequantity = price * quantityController.quantity.value;
    quantityController.items.value = pricequantity;
    Get.bottomSheet(
      backgroundColor: kPrimaryLightColor,
      Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: SizedBox(
            height: Dimensions.containerWidth,
            child: Column(
              children: [
                const Text('Konfirmasi'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(quantityController.items.toString()),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            quantityController.setQuantity(false);
                          },
                          child: const Icon(
                            Icons.remove,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(quantityController.quantity.value.toString()),
                        InkWell(
                          onTap: () {
                            quantityController.setQuantity(true);
                          },
                          child: const Icon(
                            Icons.add,
                            color: kPrimaryColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Masukan Ke Keranjang"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
