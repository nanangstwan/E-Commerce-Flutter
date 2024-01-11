import 'package:ecommerce/dimensions.dart';
import 'package:ecommerce/dummy_data.dart';
import 'package:ecommerce/profile/help_center.dart';
import 'package:ecommerce/profile/profile_menu.dart';
import 'package:ecommerce/profile/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Profile",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            SizedBox(height: Dimensions.height20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {
                Get.to(() => const HelpCenter());
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (_) {
                //     return const HelpCenter();
                //   }),
                // );
              },
            ),
            ProfileMenu(
              backgroundColor: Colors.red,
              foreground: Colors.white,
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
