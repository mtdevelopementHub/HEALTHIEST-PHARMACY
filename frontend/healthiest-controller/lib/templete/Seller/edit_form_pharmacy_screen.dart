import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_edit_pharmacy.dart';
import 'package:healthiest/controllers/seller_get_pharmacy.dart';
import 'package:healthiest/service/Seller_network.dart';
import 'package:healthiest/templete/Seller/get_pharmcy_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditFromPharmacyScreen extends StatelessWidget {
  EditFromPharmacyScreen({super.key});

  final SellerEditPharmacyController sellerEditPharmacyController =
      Get.put(SellerEditPharmacyController());

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
                          "Update Pharmacy",
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
                              sellerEditPharmacyController.nameController,
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
                          controller: sellerEditPharmacyController
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
                              sellerEditPharmacyController.addressController,
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

                     sellerEditPharmacyController.image == null
                        ?    sellerEditPharmacyController.imageUrl == null ?  SizedBox() : Image.network(
                            "https://pharmacy.alruya.link${sellerEditPharmacyController.imageUrl.toString()}",
                            height: 100,
                          )
                        : Image.file(
                            sellerEditPharmacyController.image!,
                            height: 100,
                          ),

                    // if (sellerEditPharmacyController.image != null )
                    // Image.file(
                    //              sellerEditPharmacyController.image!,
                    //   height: 100,
                    // ),
                    // if(sellerEditPharmacyController.imageUrl !=null)

                    // Image.network("https://pharmacy.alruya.link${sellerEditPharmacyController.imageUrl.toString()}"),

                    // image get button
                    ElevatedButton(
                      onPressed: sellerEditPharmacyController.getImage,
                      child: Text('Pick Image'),
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
                              await sellerEditPharmacyController
                                  .addUpdatePharmcy();
                              //  await SellerNetwork().getPharmcy();

                              await Get.find<SellerGetPharmacyController>()
                                  .getPharmacy();
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
