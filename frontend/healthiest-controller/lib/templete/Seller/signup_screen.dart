import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_signup.dart';
import 'package:healthiest/templete/Seller/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SellerSignUpScreen extends StatelessWidget {
  SellerSignUpScreen({super.key});

  final SellerSignUpController sellerSignUpController =
      Get.put(SellerSignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Form(
            key: sellerSignUpController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Image.asset(
                  'assets/Rectangle 37.png',
                  scale: 1.3,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please Signup to your account",
                      style: TextStyle(color: Colors.grey.shade400),
                    )),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(20))),
                  child: TextFormField(
                      validator: sellerSignUpController.validateName,
                      controller: sellerSignUpController.nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(20))),
                  child: TextFormField(
                      validator: sellerSignUpController.validateEmail,
                      controller: sellerSignUpController.emailController,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(20))),
                  child: TextFormField(
                      validator: sellerSignUpController.validatePassword,
                      obscureText:
                          sellerSignUpController.isObscured ? true : false,
                      controller: sellerSignUpController.passowrdController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(sellerSignUpController.isObscured
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            sellerSignUpController.isObscured =
                                !sellerSignUpController.isObscured;
                          },
                        ),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                    height: 8.h,
                    width: 44.h,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(206, 153, 86, 100)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Color.fromRGBO(
                                            206, 153, 86, 100))))),
                        onPressed: () async {
                          if (sellerSignUpController.formKey.currentState!
                              .validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Signing up...')),
                            );
                            await sellerSignUpController.register();
                            await  sellerSignUpController.isClear();
                              Get.back();
                          }

                          else{
                               ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid...')),
                            );

                          }
                        
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(
                              color: Color.fromRGBO(2, 85, 91, 100),
                              fontSize: 20.sp),
                        ))),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Please login your accounts? ",
                        style: TextStyle(color: Colors.grey.shade300)),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text("Login",
                          style: TextStyle(
                              color: Color.fromRGBO(206, 153, 86, 100))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
