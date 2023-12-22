import 'dart:async';
import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/decoration.dart';
import 'package:ecommerce/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyPageView extends StatefulWidget {
  const MyPageView({
    super.key,
  });

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController();
  var _currentPage = 0;

  List _images = [];

  Future<void> getImageServer() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.12.25/e-commerce/readkonten.php'));
      if (response.statusCode == 200) {
        // print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _images = data;
          startPageChange(); // Memulai perubahan halaman setelah data diterima
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void startPageChange() {
    if (_images.isNotEmpty) {
      // Memulai perubahan halaman setelah data diterima
      changePage();
    }
  }

  void changePage() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );  
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getImageServer(); // Memulai proses pengambilan data dari server saat widget diinisialisasi
  }

  @override
  void dispose() {
    _pageController.dispose(); // Membersihkan controller saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _images.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 5, left: 5),
                  height: Dimensions.pageViewContainer,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: 
                            NetworkImage(
                                'http://192.168.12.25/e-commerce/promo/${_images[index]['gambar']}'),
                        fit: BoxFit.cover,
                      ),
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                );
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}
