import 'dart:convert';

import 'package:ecommerce/api.dart';
import 'package:ecommerce/decoration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../dummy_data.dart';
import '../component/produk_card.dart';

class CategoryKaos extends StatefulWidget {
  const CategoryKaos({super.key});

  @override
  State<CategoryKaos> createState() => _CategoryKaosState();
}

class _CategoryKaosState extends State<CategoryKaos> {
  bool isLoading = true;

  List<ProdukList> dataFromAPI = []; // Menyimpan list dari objek ProdukList

  Future<void> _getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(API.getKaos),
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
    return isLoading
        ? const Center(child:  CircularProgressIndicator())
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  dataFromAPI.length,
                  (index) => ProdukCard(
                        nama: dataFromAPI[index].namaBarang,
                        harga: dataFromAPI[index].harga,
                        image:
                            API.storageImage + dataFromAPI[index].gambar,
                      )),
            ),
          );
  }
}
