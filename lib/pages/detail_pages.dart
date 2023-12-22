import 'package:ecommerce/dimensions.dart';
import 'package:ecommerce/pages/container.dart';
import 'package:ecommerce/pages/produk_deskripsi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailPages extends StatelessWidget {
  const DetailPages({
    Key? key,
    required this.dataModel,
  }) : super(key: key);
  final Map dataModel;

  @override
  Widget build(BuildContext context) {
    // print(dataModel);
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
              child: Image.network(dataModel['image']),
            ),
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                DeskripsiProduk(
                  titleProduk: dataModel['title'],
                  price: dataModel['price'],
                  deskripsi: dataModel['deskripsi'],
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
                      onPressed: () {},
                      child: SvgPicture.asset(
                        "assets/icons/Cart Icon.svg",
                        color: Colors.white,
                      )),
                ),
                SizedBox(width: Dimensions.height10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Add To Cart"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  scroll(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contoh Nama',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    '',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '08.00 - 16.00 WIB',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.turned_in_not,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Deskripsi',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: mediaQuery.width / 2.6,
                              height: 55,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green.shade600),
                                // color: Colors.green.shade600,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.map_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Maps',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () {},
                              child: Container(
                                width: mediaQuery.width / 2.5,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.chat,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'WhatsApp',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
