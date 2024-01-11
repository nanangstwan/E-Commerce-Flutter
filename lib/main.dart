import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/produk_controller.dart';
import 'package:ecommerce/dummy_data.dart';
import 'package:ecommerce/init.dart';
import 'package:ecommerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  Get.lazyPut(() => CartController());
  Get.lazyPut(() => ProdukController());
    return GetMaterialApp(
      scaffoldMessengerKey: Utils.messagerKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: const InitScreen(),
    );
  }
}
