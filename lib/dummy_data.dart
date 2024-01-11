import 'dart:convert';

import 'package:flutter/material.dart';

enum SizeOption { M, L, XL, XXL }

// To parse this JSON data, do
//
//     final produkList = produkListFromJson(jsonString);

List<ProdukList> produkListFromJson(String str) => List<ProdukList>.from(json.decode(str).map((x) => ProdukList.fromJson(x)));

String produkListToJson(List<ProdukList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProdukList {
    String idBarang;
    String namaBarang;
    String stok;
    String harga;
    String? deskripsi;
    String idKategori;
    String gambar;

    ProdukList({
        required this.idBarang,
        required this.namaBarang,
        required this.stok,
        required this.harga,    
        required this.deskripsi,
        required this.idKategori,
        required this.gambar,
    });

    factory ProdukList.fromJson(Map<String, dynamic> json) => ProdukList(
        idBarang: json["id_barang"],
        namaBarang: json["nama_barang"],
        stok: json["stok"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        idKategori: json["id_kategori"],
        gambar: json["gambar"],
    );

    Map<String, dynamic> toJson() => {
        "id_barang": idBarang,
        "nama_barang": namaBarang,
        "stok": stok,
        "harga": harga,
        "deskripsi": deskripsi,
        "id_kategori": idKategori,
        "gambar": gambar,
    };
}

class Utils {
  static GlobalKey<ScaffoldMessengerState> messagerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);
    messagerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  
  }
}