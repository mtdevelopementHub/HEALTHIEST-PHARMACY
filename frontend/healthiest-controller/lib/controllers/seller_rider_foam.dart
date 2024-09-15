import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/models/getUpdatePharmacyModel.dart';
import 'package:healthiest/service/Seller_network.dart';

class SellerRiderFoamController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactnumberController = TextEditingController();
  TextEditingController cnicController = TextEditingController();

  void onInit() {
    // TODO: implement initState
    super.onInit();
    pharmacy_id = Get.arguments['pharmacy_id'];

  //  getUpdatePharmacy();
  }

  late String pharmacy_id;


  Future riderAdd() async {
     SellerNetwork().addRider(pharmacy_id,nameController.text,contactnumberController.text,cnicController.text);
    update();
  }


}
