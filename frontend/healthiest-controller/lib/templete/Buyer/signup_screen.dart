import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/service/buyer_network.dart';
import 'package:healthiest/templete/Buyer/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuyerSigUpScreen extends StatefulWidget {
  const BuyerSigUpScreen({super.key});

  @override
  State<BuyerSigUpScreen> createState() => _BuyerSigUpScreenState();
}

class _BuyerSigUpScreenState extends State<BuyerSigUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();

  Future registerBuyer() async {
    final reg = await BuyerNetwork().buyerRegister(
        nameController.text, emailController.text, passowrdController.text);
    print(reg);
  }

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.clear();
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
                      controller: nameController,
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
                          new BorderRadius.all(new Radius.circular(20))),
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Signing up...')),
                            );

                            await registerBuyer();
                            Get.to(BuyerLoginScreen());
                          } else {
                            Get.to(BuyerSigUpScreen());
                          }

                          dispose();
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
                        Get.to(BuyerLoginScreen());
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
