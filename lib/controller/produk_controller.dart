import 'dart:convert';

import 'package:ecommerce/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api.dart';

class ProdukController extends GetxController {
  var allProduk = <ProdukList>[].obs;

  Future getAllProduk(apiController) async {
    try {
      final response = await GetConnect().get(apiController);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        allProduk.value =
            jsonResponse.map((json) => ProdukList.fromJson(json)).toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    getAllProduk(API);
    super.onInit();
  }

void getproduk(){
  getAllProduk(API.allProduk);
}


  void selectProduk(int index) {
    
  }
}
