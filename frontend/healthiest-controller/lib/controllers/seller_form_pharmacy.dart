import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/service/Seller_network.dart';
import 'package:image_picker/image_picker.dart';

class SellerAddFormPharmacyController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactnumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? image;
  Future addPharmcy() async {
    final reg = await SellerNetwork().addPharmcy(nameController.text,
        contactnumberController.text, addressController.text,image);

   // final gg = await SellerNetwork().getPharmcy();

    print(reg);
    update();
  }

    Future<void> getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      update();
    }
  }


isClear(){
  nameController.clear();
  contactnumberController.clear();
  addressController.clear();
}


  
}
