import 'package:ecommerce/decoration.dart';
import 'package:ecommerce/dimensions.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Business Inquiries',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              const Row(children: [
                Icon(
                  Icons.email,
                  color: kPrimaryColor,
                  weight: 22,
                ),
                SizedBox(width: 20),
                Expanded(child: Text('stwannanang@gmail.com')),
              ]),
              const Row(children: [
                Icon(
                  Icons.call,
                  color: kPrimaryColor,
                  weight: 22,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text('+62 856 4149 7406'),
                ),
              ]),
              const SizedBox(height: 100),
              Text(
                'Contact Us Developer',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              const Row(children: [
                Icon(
                  Icons.email,
                  color: kPrimaryColor,
                  weight: 22,
                ),
                SizedBox(width: 20),
                Expanded(child: Text('nanangstwan201@gmail.com')),
              ]),
              const Row(children: [
                Icon(
                  Icons.call,
                  color: kPrimaryColor,
                  weight: 22,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text('+62 858 7770 7558'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
