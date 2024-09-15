import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/controllers/seller_get_pharmacy.dart';
import 'package:healthiest/role_screen.dart';
import 'package:healthiest/service/Seller_network.dart';
import 'package:healthiest/templete/Seller/get_medicine_screen.dart';
import 'package:healthiest/templete/Seller/add_pharmacy_form_Screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetPharmcyScreen extends StatelessWidget {
  GetPharmcyScreen({super.key});

// ya controller ka instance hy jis sy data  get kar rahy ho
  final SellerGetPharmacyController sellerGetPharmacy =
      Get.put(SellerGetPharmacyController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      child: GetBuilder(
          init: SellerGetPharmacyController(),
          builder: (_) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.green.shade300,
                centerTitle: true,
                title: Text("Pharmcy List"),
                actions: [
                  // yaha button sy pharmacy add form hy
                  GestureDetector(
                      onTap: () {
                        Get.to(AddPharmacyFormScreen());
                      },
                      child: Icon(Icons.add)),
                      SizedBox(width: 20,),
                       GestureDetector(
                      onTap: () {
                       SellerNetwork().sellerLogout();
                  Get.offAll(RoleScreen());
                      },
                      child: Icon(Icons.logout,size: 20,)),
                  SizedBox(
                    width: 2.h,
                  )
                ],
              ),
              body: sellerGetPharmacy.gpharmacy.isEmpty
                  ? Center(child:Text('No Pharmacy'))
                  : ListView.builder(
                      itemCount: sellerGetPharmacy.gpharmacy.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'LICIENSE IMAGE',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: 20.h,
                                    width: 50.h,
                                    color: Colors.grey.shade400,
                                    child: Image.network(
                                        "https://pharmacy.alruya.link${sellerGetPharmacy.gpharmacy[index].image.toString()}"),
                                  ),
                                ],
                              ),
                              Container(  height: 3.h,
                                width: 50.h,
                                color: Colors.grey.shade400,),
                            
                              Container(
                                height: 7.h,
                                width: 50.h,
                                color: Colors.grey.shade400,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'PHARMACY NAME:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(sellerGetPharmacy
                                            .gpharmacy[index].name
                                            .toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'LOCATION:  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(sellerGetPharmacy
                                            .gpharmacy[index].location
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.grey.shade300,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    side:
                                        BorderSide(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
      
                                       IconButton(
                                        icon: Icon(Icons.delivery_dining_outlined),
                                        onPressed: () async {
                                          print(sellerGetPharmacy
                                              .gpharmacy[index].id
                                              .toString());
                                          //ya aska route hy yaha sy id bhaj raha hy pharmacy ki jis pr wo data get ho raha hy
                                          Get.toNamed('/sellerRiderScreen',
                                              arguments: {
                                                'pharmacy_id': sellerGetPharmacy
                                                    .gpharmacy[index].id
                                                    .toString()
                                              }
                                              );
      
                                          print(Get.arguments['pharmacy_id']);
                                        },
                                      ),
                                      //ya icon button hy jis sy hamra medicine get ho rahi hy or id bhaj kar open hota hy
                                      IconButton(
                                        icon: Icon(Icons.local_pharmacy),
                                        onPressed: () async {
                                          print(sellerGetPharmacy
                                              .gpharmacy[index].id
                                              .toString());
                                          //ya aska route hy yaha sy id bhaj raha hy pharmacy ki jis pr wo data get ho raha hy
                                          Get.toNamed('/sellerGetMedicineScreen',
                                              arguments: {
                                                'pharmacy_id': sellerGetPharmacy
                                                    .gpharmacy[index].id
                                                    .toString()
                                              });
      
                                          print(Get.arguments['pharmacy_id']);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          print(sellerGetPharmacy
                                              .gpharmacy[index].id);
      
                                          Get.toNamed('/sellerEditPharmacyScreen',
                                              arguments: {
                                                'pharmacy_id': sellerGetPharmacy
                                                    .gpharmacy[index].id
                                                    .toString()
                                              });
                                        },
                                      ),
                                      //yaha pr as pharmacy ko jo order recive hua hy wo list get ho rahi hy hm yaha sy asy id dy rha hy pharmacy
                                      IconButton(
                                        icon: Icon(Icons.shopping_basket),
                                        onPressed: () {
                                          print(sellerGetPharmacy
                                              .gpharmacy[index].id);
      
                                          Get.toNamed('/sellerGetOrderScreen',
                                              arguments: {
                                                'pharmacy_id': sellerGetPharmacy
                                                    .gpharmacy[index].id
                                                    .toString()
                                              });
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () async {
                                          sellerGetPharmacy.deletePharmcy(
                                              sellerGetPharmacy
                                                  .gpharmacy[index].id
                                                  .toString());
                                        },
                                      ),
                                    ],
                                  ),
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
          }),
    );
  }
}
