import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthiest/service/buyer_network.dart';
import 'package:healthiest/templete/Buyer/home_screen.dart';
import 'package:healthiest/templete/Buyer/medicine_screen.dart';
import 'package:healthiest/templete/Buyer/signup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuyerLoginScreen extends StatefulWidget {
  const BuyerLoginScreen({super.key});

  @override
  State<BuyerLoginScreen> createState() => _BuyerLoginScreenState();
}

class _BuyerLoginScreenState extends State<BuyerLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  bool? status;

  late final name;
  late final email;

  Future<bool> loginBuyer() async {
    final reg = await BuyerNetwork()
        .buyerLogin(emailController.text, passowrdController.text);
    name = reg['data']['user']['name'];
    email = reg['data']['user']['email'];

    print(reg['data']);
    return reg['data']['status'];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.clear();
    passowrdController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 85, 91, 100),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                      "Login",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please login to your account",
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
                      controller: emailController,
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
                           BorderRadius.all(new Radius.circular(20))),
                  child: TextFormField(
                      controller: passowrdController,
                      decoration: InputDecoration(
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
                          if (_formKey.currentState!.validate()) {
                            final success = await loginBuyer();
                            if (success == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Successfully Login")),
                              );
                              await Get.to( ()=> HomeScreen(
                                name: name,
                                email: email,
                              ));
                            } else if (success == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Invalid Login")),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text("Email and Password Invalid")),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid')),
                            );
                          }

                          //await loginBuyer();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Color.fromRGBO(2, 85, 91, 100),
                              fontSize: 20.sp),
                        ))),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style:
                          TextStyle(color: Color.fromRGBO(206, 153, 86, 100)),
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",
                        style: TextStyle(color: Colors.grey.shade300)),
                    GestureDetector(
                      onTap: () {
                        Get.to(()=> BuyerSigUpScreen());
                      },
                      child: Text("Create new now!",
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
