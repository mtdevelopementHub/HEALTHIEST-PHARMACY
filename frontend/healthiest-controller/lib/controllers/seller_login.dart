
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/service/Seller_network.dart';

class SellerLoginController extends GetxController  {
       bool isObscured = true;

  final formKey = GlobalKey<FormState>();

  isObsured(){
     isObscured = !isObscured;

       update();
  }
  

  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  bool? status;

  Future<bool> loginSeller() async {
    final reg = await SellerNetwork()
        .sellerLogin(emailController.text, passowrdController.text);
    return reg['data']['status'];
  }


isClear(){
  emailController.clear();
  passowrdController.clear();
}

  
}