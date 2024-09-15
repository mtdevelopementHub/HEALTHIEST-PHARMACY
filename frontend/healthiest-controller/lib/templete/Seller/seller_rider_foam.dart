import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_edit_pharmacy.dart';
import 'package:healthiest/controllers/seller_get_pharmacy.dart';
import 'package:healthiest/controllers/seller_get_rider.dart';
import 'package:healthiest/controllers/seller_rider_foam.dart';
import 'package:healthiest/service/Seller_network.dart';
import 'package:healthiest/templete/Seller/get_pharmcy_screen.dart';
import 'package:healthiest/templete/Seller/get_rider_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SellerRiderFoamScreen extends StatelessWidget {
  SellerRiderFoamScreen({super.key});

  final SellerRiderFoamController sellerRiderController =
      Get.put(SellerRiderFoamController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SellerEditPharmacyController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.green.shade300,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                  
                    SizedBox(
                      height: 8.h,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Rider Add Foam",
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      decoration: new BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(20))),
                      child: TextFormField(
                          controller:
                              sellerRiderController.nameController,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: new BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(20))),
                      child: TextFormField(
                          controller: sellerRiderController
                              .contactnumberController,
                          decoration: InputDecoration(
                            hintText: 'Contact Number',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      decoration: new BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(20))),
                      child: TextFormField(
                          controller:
                              sellerRiderController.cnicController,
                          decoration: InputDecoration(
                            hintText: 'CNIC',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 1.h,
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
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Color.fromRGBO(
                                                206, 153, 86, 100))))),
                            onPressed: () async {
                              sellerRiderController.riderAdd();

                              await Get.find<GetRiderController>().getRider();

                              Get.back();

                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Color.fromRGBO(2, 85, 91, 100),
                                  fontSize: 20.sp),
                            ))),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
