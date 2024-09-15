import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_login.dart';
import 'package:healthiest/role_screen.dart';
import 'package:healthiest/service/Seller_network.dart';
import 'package:healthiest/templete/Seller/get_pharmcy_screen.dart';
import 'package:healthiest/templete/Seller/seller_role.dart';
import 'package:healthiest/templete/Seller/signup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SellerLoginScreen extends StatelessWidget {
  SellerLoginScreen({super.key});


//controller hy yA seller login ka instance hy
  final SellerLoginController sellerLoginController =
      Get.put(SellerLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          //getbuilder laga hua hy hn ya  jis sy update hoti hy screen  controller sy
          child: GetBuilder(
              init: sellerLoginController,
              builder: (_) {
                return Form(
                  key: sellerLoginController.formKey,
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
                                //TextFormField hy email ki
                        child: TextFormField(
                            validator: sellerLoginController.validateEmail,
                            controller: sellerLoginController.emailController,
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
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
                                //TextFormField ya password field hy
                        child: TextFormField(
                            obscureText:
                                sellerLoginController.isObscured ? true : false,
                            validator: sellerLoginController.validatePassword,
                            controller:
                                sellerLoginController.passowrdController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(sellerLoginController.isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  sellerLoginController.isObsured();
                                },
                              ),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                          height: 8.h,
                          width: 44.h,
                          //elevated button jis sy login hony ka bd role  screen  pharmacy and rider pr move kar rha hy wo
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(206, 153, 86, 100)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  206, 153, 86, 100))))),
                              onPressed: () async {
                                if (sellerLoginController.formKey.currentState!
                                    .validate()) {
                                  final success =
                                      await sellerLoginController.loginSeller();
                                      sellerLoginController.isClear();
                                  if (success == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Successfully Login")),
                                    );
                                    //NAVIGATOR ROLE SCREEN
                                    await Get.to(GetPharmcyScreen());
                                  } else if (success == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Invalid Login")),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Email and Password Invalid")),
                                    );
                                    await Get.to(()=>GetPharmcyScreen());
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(SellerNetwork()
                                            .messagelogin
                                            .toString())),
                                  );
                                  //AGR FAIL, HO JATA HY KUCH RONG HOTA HY TO AGAIN LOGIN SCREEEN AJAY GA
                                  await Get.to(SellerLoginScreen());
                                }
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
                      
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",
                              style: TextStyle(color: Colors.grey.shade300)),
                          GestureDetector(
                            onTap: () {
                              Get.to(SellerSignUpScreen());
                            },
                            child: Text("Create new now!",
                                style: TextStyle(
                                    color: Color.fromRGBO(206, 153, 86, 100))),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
