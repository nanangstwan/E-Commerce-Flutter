import 'dart:convert';

import 'package:ecommerce/Home.dart/component/produk_card.dart';
import 'package:ecommerce/Home.dart/component/search.dart';
import 'package:ecommerce/decoration.dart';
import 'package:ecommerce/dummy_data.dart';
import 'package:ecommerce/pages/detail_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class MyProduk extends StatefulWidget {
  const MyProduk({super.key});

  @override
  State<MyProduk> createState() => _MyProdukState();
}

class _MyProdukState extends State<MyProduk> {
  bool isLoading = true;

  List<ProdukList> dataFromAPI = []; // Menyimpan list dari objek ProdukList

  Future<void> _getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse('http://192.168.12.25/e-commerce/read.php'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        // print(response.body);
        // Mengonversi list JSON menjadi list dari objek ProdukList
        dataFromAPI =
            jsonResponse.map((json) => ProdukList.fromJson(json)).toList();
        isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: GridView.count(
                crossAxisSpacing: 2.0,
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.5,
                children: List.generate(
                  dataFromAPI.length,
                  (index) => InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        ProdukList produk = dataFromAPI[index];
                        return DetailPages(
                          dataModel: {
                            'image':
                                'http://192.168.12.25/e-commerce/p/${produk.gambar} ',
                            'title': produk.namaBarang.toString(),
                            'price': produk.harga.toString(),
                            'deskripsi': produk.deskripsi.toString()
                          },
                        );
                      }));
                    },
                    child: ProdukCard(
                        image:
                            'http://192.168.12.25/e-commerce/p/${dataFromAPI[index].gambar}',
                        nama: dataFromAPI[index].namaBarang,
                        harga: dataFromAPI[index].harga),
                  ),
                ),
              ),

              // ListView.builder(
              //     itemCount: _listData.length,
              //     itemBuilder: (context, index) {
              //       return ProdukCard();
              //     }),
            ),
    );
  }
}
