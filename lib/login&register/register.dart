import 'dart:convert';

import 'package:ecommerce/api.dart';
import 'package:ecommerce/dummy_data.dart';
import 'package:ecommerce/init.dart';
import 'package:ecommerce/login&register/dataModel.dart';
import 'package:ecommerce/login&register/login.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final TextEditingController _confirmpasscontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _usernamecontroller.dispose();
    _passcontroller.dispose();
    _confirmpasscontroller.dispose();

    super.dispose();
  }

  validateUserEmail() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;
    try {
      var response = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'email': _emailcontroller.text.trim(),
        },
      );
      if (response.statusCode == 200) {
        var resbody = jsonDecode(response.body);
        if (resbody['emailFound'] == true) {
          Utils.showSnackBar('Email is Already in Someone else Use.');
        } else {
          registerDataRecord();
        }
      }
    } catch (e) {
      print(e);
      Utils.showSnackBar(e.toString());
    }
  }

  registerDataRecord() async {
    UserModel userData = UserModel(
      1,
      _emailcontroller.text.trim(),
      _usernamecontroller.text.trim(),
      _passcontroller.text.trim(),
    );
    try {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userData.toJson(),
      );
      if (res.statusCode == 200) {
        var resBodySignUp = jsonDecode(res.body);
        if (resBodySignUp['success'] == true) {
          Utils.showSnackBar('SignUp Succesfully');
        } else {
          Utils.showSnackBar('Try Again');
        }
      }
    } catch (e) {
      print(e.toString());
      Utils.showSnackBar(e.toString());
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
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Register Here",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                // Image.asset(
                //   "image/register.jpg",
                //   height: 250,
                //   width: double.infinity,
                // ),
                const Text(
                  "Get Registered From Here",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Email',
                        contentPadding: EdgeInsets.all(10)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: ((email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a Valid Email'
                            : null),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Username",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    controller: _usernamecontroller,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Username',
                        contentPadding: EdgeInsets.all(10)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    controller: _passcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.all(10)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: ((value) => value != null && value.length < 6
                        ? 'Enter min. 6 Characters'
                        : null),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                      controller: _confirmpasscontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Confirm Password',
                          contentPadding: EdgeInsets.all(10)),
                      validator: (val) {
                        if (val != _passcontroller.text) {
                          return 'Password Not Match';
                        }
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    validateUserEmail();
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account ? ",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: Text(
                        "Sign In ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
