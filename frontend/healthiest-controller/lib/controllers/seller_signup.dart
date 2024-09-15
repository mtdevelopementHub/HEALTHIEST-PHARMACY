import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/service/Seller_network.dart';

class SellerSignUpController extends GetxController {

   final formKey = GlobalKey<FormState>();
  bool isObscured = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();

  Future register() async {
    final reg = await SellerNetwork().textApi(
        nameController.text, emailController.text, passowrdController.text);
    print(reg);
    update();
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    }
    update();
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    update();
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    update();
    return null;
  }
  
 isClear(){
  nameController.clear();
  emailController.clear();
  passowrdController.clear();
  
}


  
}