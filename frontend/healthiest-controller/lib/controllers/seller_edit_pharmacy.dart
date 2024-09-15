import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/models/getUpdatePharmacyModel.dart';
import 'package:healthiest/service/Seller_network.dart';
import 'package:image_picker/image_picker.dart';

class SellerEditPharmacyController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactnumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
   File? image;
   String? imageUrl;



  void onInit() {
    // TODO: implement initState
    super.onInit();
    pharmacy_id = Get.arguments['pharmacy_id'];

    getUpdatePharmacy();
  }

  late String pharmacy_id;

  var gpharmacy;

  Future getUpdatePharmacy() async {
    final data = GetUpdatePharmacy.fromJson(
        await SellerNetwork().getUpdatePharmcy(pharmacy_id.toString()));
    nameController.text = data.pharmacy.name.toString();
    contactnumberController.text = data.pharmacy.contactNumber.toString();
    addressController.text = data.pharmacy.location.toString();
     imageUrl = data.pharmacy.image.toString();
    gpharmacy = data.pharmacy;
    update();
  }

  Future addUpdatePharmcy() async {
    final reg = await SellerNetwork().addUpdatePharmcy(
        pharmacy_id.toString(),
        nameController.text,
        contactnumberController.text,
        addressController.text,
        image
        );
    update();
    print(reg);
  }


   Future<void> getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      update();
    }
  }

}
