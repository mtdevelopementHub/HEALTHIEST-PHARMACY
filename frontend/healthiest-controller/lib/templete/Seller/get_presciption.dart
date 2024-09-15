import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_get_medicines.dart';
import 'package:healthiest/controllers/seller_get_presciption.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetPresciptionScreen extends StatelessWidget {
  GetPresciptionScreen({super.key});

  final SellerGetPresciption sellerGetPresciption =
      Get.put(SellerGetPresciption());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SellerGetPresciption(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green.shade300,
              centerTitle: true,
              title: Text("Presciption List"),
            ),
            body: controller.gpharmacy.isEmpty
                ? Center(child: Text("Not Need Presciption"))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.gpharmacy.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: Column(
                          children: [
                            Image.network(
                              "https://pharmacy.alruya.link${controller.gpharmacy[index].image.toString()}",
                              width: 30.h,
                              height: 30.h,
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
