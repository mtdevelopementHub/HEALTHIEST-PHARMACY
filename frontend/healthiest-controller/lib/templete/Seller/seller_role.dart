import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/templete/Seller/get_pharmcy_screen.dart';
import 'package:healthiest/templete/Seller/get_rider_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SellerRoleScreen extends StatefulWidget {
  const SellerRoleScreen({super.key});

  @override
  State<SellerRoleScreen> createState() => _SellerRoleScreenState();
}

class _SellerRoleScreenState extends State<SellerRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 8.h,
                width: 44.h,

              //BUTTON HY YA JO NAVIGATE HO RAHA HY PHARMACY LIST SCREEN PR
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
                                    //YA WO CLASS HY 

                      Get.to(GetPharmcyScreen());
                    },
                    child: Text(
                      'Pharmacy',
                      style: TextStyle(
                          color: Color.fromRGBO(2, 85, 91, 100),
                          fontSize: 20.sp),
                    ))),
          ),
          SizedBox(
            height: 3.h,
          ),
          Center(
            child: Container(
                height: 8.h,
                width: 44.h,
                              //BUTTON HY YA JO NAVIGATE HO RAHA HY RIDER LIST SCREEN PR

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
                      //YA WO CLASS HY
                      Get.to(SellerRiderScreen());
                    },
                    child: Text(
                      'Rider',
                      style: TextStyle(
                          color: Color.fromRGBO(2, 85, 91, 100),
                          fontSize: 20.sp),
                    ))),
          ),
        ],
      ),
    );
  }
}
