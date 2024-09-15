import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_get_medicines.dart';
import 'package:healthiest/templete/Seller/add_medicine_form_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetMedicineScreen extends StatelessWidget {
  GetMedicineScreen({super.key});

  final SellerGetMedicineController sellerGetMedicineController =
      Get.put(SellerGetMedicineController());

  @override
  Widget build(BuildContext context) {
    final Pharmacy_id = Get.arguments['pharmacy_id'];
    return GetBuilder(
        init: SellerGetMedicineController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green.shade300,
              centerTitle: true,
              title: Text("Medicine List"),
              actions: [
                GestureDetector(
                    onTap: () {
                      Get.to(SellerMedicineForm());
                      sellerGetMedicineController.pharmacyId();
                    },
                    child: Icon(Icons.add)),
                SizedBox(
                  width: 2.h,
                )
              ],
            ),
            body: sellerGetMedicineController.gpharmacy.isEmpty
                ? Center(child: Text("Medicine is not Available"))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: sellerGetMedicineController.gpharmacy.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey.shade300,
                              child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  leading: Image.network(
                                      "https://pharmacy.alruya.link${sellerGetMedicineController.gpharmacy[index].image.toString()}"),
                                  title: Text(sellerGetMedicineController
                                      .gpharmacy[index].name
                                      .toString()),
                                  subtitle: Text(sellerGetMedicineController
                                      .gpharmacy[index].dosage),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/sellerGetPresciption',
                                                arguments: {
                                                  "medicine_id":
                                                      sellerGetMedicineController
                                                          .gpharmacy[index].id
                                                          .toString()
                                                });
                                          },
                                          child:
                                              Icon(Icons.local_hospital_outlined)),

                                              SizedBox(width: 10,),

                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed('/sellerEditMedicineForm',arguments:{
                                                    'pharmacy_id':Pharmacy_id,
                                                    'medicine_id':  sellerGetMedicineController
                                                          .gpharmacy[index].id
                                                          .toString(),

                                                           'medicine_name':  sellerGetMedicineController
                                                          .gpharmacy[index].name
                                                          .toString(),

                                                           'medicine_dosage':  sellerGetMedicineController
                                                          .gpharmacy[index].dosage
                                                          .toString(),

                                                           'medicine_price':  sellerGetMedicineController
                                                          .gpharmacy[index].price
                                                          .toString(),

                                                           'medicine_formula':  sellerGetMedicineController
                                                          .gpharmacy[index].formula
                                                          .toString(),

                                                           'medicine_quantity':  sellerGetMedicineController
                                                          .gpharmacy[index].quantity
                                                          .toString(),

                                                           'medicine_description':  sellerGetMedicineController
                                                          .gpharmacy[index].description
                                                          .toString(),

                                                           'medicine_category':  sellerGetMedicineController
                                                          .gpharmacy[index].categoryId
                                                          .toString(),

                                                            'medicine_status':  sellerGetMedicineController
                                                          .gpharmacy[index].status
                                                          ,

                                                           'medicine_isverified':  sellerGetMedicineController
                                                          .gpharmacy[index].isVerified
                                                          ,

                                                          'medicine_image':  sellerGetMedicineController.gpharmacy[index].image.toString()
                                                  } );
                                                },
                                                child: Icon(Icons.edit))
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 1.h,
                            )
                          ],
                        ),
                      );
                    }),
          );
        });
  }
}
