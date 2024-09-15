import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_get_medicines.dart';
import 'package:healthiest/controllers/seller_get_order_medicine.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetOrderScreen extends StatelessWidget {
  GetOrderScreen({super.key});

  final SellerGetOrderMedicine sellerGetOrder =
      Get.put(SellerGetOrderMedicine());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SellerGetMedicineController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green.shade300,
              centerTitle: true,
              title: Text("Order List"),
            ),
            body: sellerGetOrder.gpharmacy.isEmpty
                ? Center(child: Text("Not Order"))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: sellerGetOrder.gpharmacy.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: Column(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                
                                      Text(
                                          "Medicine Name: ${sellerGetOrder.gpharmacy[index].medicine.toString()}"),
                                
                                
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            "Name: ${sellerGetOrder.gpharmacy[index].name.toString()}"),
                                        Text(
                                            "Order# ${sellerGetOrder.gpharmacy[index].orderNumber.toString()}"),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            "Quantity: ${sellerGetOrder.gpharmacy[index].quantity.toString()}"),
                                        Text(
                                            "Price: ${sellerGetOrder.gpharmacy[index].price.toString()}"),
                                      ],
                                    ),
                                     Text(
                                            "Contact: ${sellerGetOrder.gpharmacy[index].contactNo.toString()}"),
                                    Text(
                                        "Payment: ${sellerGetOrder.gpharmacy[index].paymentMethod.toString()}"),
                                    Text(
                                        "Areas: ${sellerGetOrder.gpharmacy[index].address.toString()}"),
                                    Text(
                                        "Email: ${sellerGetOrder.gpharmacy[index].email.toString()}"),
                                    SizedBox(
                                      height: 1.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h,)
                          ],
                        ),
                      );
                    }),
          );
        });
  }
}
