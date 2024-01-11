import 'dart:convert';

import 'package:ecommerce/decoration.dart';
import 'package:ecommerce/dummy_data.dart';
import 'package:ecommerce/init.dart';
import 'package:ecommerce/login&register/dataModel.dart';
import 'package:ecommerce/login&register/register.dart';
import 'package:ecommerce/login&register/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passcontroller.dispose();

    super.dispose();
  }

  loginUser() async {
    try {
      var res = await http.post(
        Uri.parse(API.coba),
        body: {
          "email": _emailcontroller.text.trim(),
          "passwordd": _passcontroller.text.trim()
        },
      );

      if (res.statusCode == 200) {
        var resBodySignIn = jsonDecode(res.body);
        if (resBodySignIn['success'] == true) {
          Utils.showSnackBar('SignUp Succesfully');
        } else {
          Utils.showSnackBar('Try Again');
        }
      }
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.signIn),
        body: {
          "email": _emailcontroller.text.trim(),
          "passwordd": _passcontroller.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodySignIn = jsonDecode(res.body);

        if (resBodySignIn['success'] == true) {
          Utils.showSnackBar('SignIn Succesfully');

          UserModel userInfo = UserModel.fromJson(resBodySignIn["userData"]);

          await RememberUserPref.saveRememberUser(userInfo);
          Future.delayed(const Duration(seconds: 2), () {
            Get.to(const InitScreen());
          });
        } else {
          Utils.showSnackBar('Incorect\nEmail and Password Not Matching');
        }
      }
    } catch (e) {
      Utils.showSnackBar(
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hello,",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 2.5),
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              // Image.asset(
              //   "image/register.jpg",
              //   height: 250,
              //   width: double.infinity,
              // ),
              const Text(
                "Get Logged In From Here",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 20),
              const Text(
                "Email",
                style: TextStyle(fontSize: 12),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextField(
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Your Email',
                      contentPadding: EdgeInsets.all(10)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Password",
                style: TextStyle(fontSize: 12),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TextField(
                  controller: _passcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      contentPadding: EdgeInsets.all(10)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  loginUser();
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "don't have an account ? ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const RegisterScreen());
                    },
                    child: const Text(
                      "Sign Up ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: kPrimaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
