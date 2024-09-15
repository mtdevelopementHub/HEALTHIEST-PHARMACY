import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_form_pharmacy.dart';
import 'package:healthiest/controllers/seller_get_pharmacy.dart';
import 'package:healthiest/templete/Seller/get_pharmcy_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddPharmacyFormScreen extends StatelessWidget {
  AddPharmacyFormScreen({super.key});
//controller instance hy 
  final SellerAddFormPharmacyController sellerFormPharmacyController =
      Get.put(SellerAddFormPharmacyController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SellerAddFormPharmacyController(),
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
                          "Add Pharmacy",
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
                              //ya name field
                      child: TextFormField(
                          controller:
                              sellerFormPharmacyController.nameController,
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

                              //contaact number field hy ya
                      child: TextFormField(
                          controller: sellerFormPharmacyController
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
                              // yas address field hy
                      child: TextFormField(
                          controller:
                              sellerFormPharmacyController.addressController,
                          decoration: InputDecoration(
                            hintText: 'Address',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),

                       SizedBox(height: 20),
                    if (sellerFormPharmacyController.image != null)
                      Image.file(
                        sellerFormPharmacyController.image!,
                        height: 100,
                      ),
                      // image get button
                    ElevatedButton(
                      onPressed: sellerFormPharmacyController.getImage,
                      child: Text('Pick Image'),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),






                    Container(
                        height: 8.h,
                        width: 44.h,
                        //add phamry btton  hy submit ka 
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
                             await    sellerFormPharmacyController.addPharmcy();

                         await     Get.find<SellerGetPharmacyController>().getPharmacy();
                         sellerFormPharmacyController.isClear();
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
