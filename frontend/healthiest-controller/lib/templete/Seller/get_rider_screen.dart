import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_get_rider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SellerRiderScreen extends StatelessWidget {
  SellerRiderScreen({super.key});
// CONTROLLER KA INSTANCE HY YA JIS SY HM CONTROLLER SY DATA GET KAR RAha hy
  final GetRiderController riderController = Get.put(GetRiderController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GetRiderController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green.shade300,
              centerTitle: true,
              title: Text("Rider"),
              actions: [
                GestureDetector(
                    onTap: () {
                      print(riderController.pharmacy_id.toString());
                      //ya aska route hy yaha sy id bhaj raha hy pharmacy ki jis pr wo data get ho raha hy
                      Get.toNamed('/sellerAddRiderScreen', arguments: {
                        'pharmacy_id': riderController.pharmacy_id.toString()
                      });
                    },
                    child: Icon(Icons.add))
              ],
            ),
            body: riderController.gpharmacy.isEmpty
                ? Center(child: Text('Rider are not available'))
                //ya list view builder hy jo list print kae raha hy
                : ListView.builder(
                    itemCount: riderController.gpharmacy.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: Column(
                          children: [
                            Container(
                              height: 10.h,
                              color: Colors.grey.shade300,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Name: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(riderController
                                              .gpharmacy[index].name
                                              .toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Contact Number: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(riderController
                                              .gpharmacy[index].contactNumber
                                              .toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'CNIC: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(riderController
                                              .gpharmacy[index].cnic
                                              .toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        riderController.riderDelete(
                                            riderController.gpharmacy[index].id
                                                .toString());
                                      },
                                      child: Icon(Icons.delete))
                                ],
                              ),
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
