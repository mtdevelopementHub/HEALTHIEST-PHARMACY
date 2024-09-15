import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/templete/Buyer/login_screen.dart';
import 'package:healthiest/templete/Seller/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(2, 85, 91, 100) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40.h,),
           Center(
             child: Container(
                    height: 8.h,
                    width: 44.h,
                    //Elevated button hy jo navigate kar raha hy buyer login pr
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(206, 153, 86, 100)),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Color.fromRGBO(
                                                206, 153, 86, 100))))),
                        onPressed: () {
                          Get.to(()=> BuyerLoginScreen());
                        },
                        child: Text(
                          'Buyer',
                          style: TextStyle(
                              color: Color.fromRGBO(2, 85, 91, 100),
                              fontSize: 20.sp),
                        ))),
           ),
                      SizedBox(height: 3.h,),
                        Center(
                          child: Container(
                                            height: 8.h,
                                            width: 44.h,
                                                                //Elevated button hy jo navigate kar raha hy seller login pr

                                            child: ElevatedButton(
                                                style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(206, 153, 86, 100)),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Color.fromRGBO(
                                                206, 153, 86, 100))))),
                                                onPressed: () {    
                                                 Get.to(()=> SellerLoginScreen());
                                                },
                                                child: Text(
                          'Seller',
                          style: TextStyle(
                              color: Color.fromRGBO(2, 85, 91, 100),
                              fontSize: 20.sp),
                                                ))),
                        ),
                          Spacer(),
          Image.asset(
            'assets/Group 6295.png',
          )
      ],),
    );
  }
}