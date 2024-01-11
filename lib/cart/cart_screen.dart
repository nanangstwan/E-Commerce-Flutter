import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/cart_card.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "1 items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => const Padding(
            padding:  EdgeInsets.symmetric(vertical: 10),
            child:  CartCard()
          ),
        ),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
