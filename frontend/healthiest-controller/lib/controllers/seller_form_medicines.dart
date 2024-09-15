import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/service/Seller_network.dart';
import 'package:image_picker/image_picker.dart';

class SellerMedicineFormController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController formulaController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  bool checkBoxValue = false;
  bool isVerified = false;
  File? image;

  String selectedItem1 = 'Liquid';

  void selectTablet() {
    selectedItem1;
    tablet_id;

    update();
  }

  void selectCheckedBox() {
    checkBoxValue;
    update();
  }

  void isVerif() {
    isVerified;
    update();
  }

  late String tablet_id;

  List<String> items = [
    'Liquid',
    'Tablet',
    'Capsules',
    'Topical Medicines',
    'Drops',
    'Inhalers',
    'Injections'
  ];

  Map<String, String> keyValueMap = {
    'Liquid': '1',
    'Tablet': "2",
    'Capsules': "3",
    'Topical Medicines': "4",
    'Drops': '5',
    'Inhalers': "6",
    'Injections': "7",
  };

  Future<void> medicineData() async {
    final medicine = await SellerNetwork().postData(
      pharmacy_id.toString(),
      nameController.text,
      dosageController.text,
      priceController.text,
      formulaController.text,
      quantityController.text,
      tablet_id.toString(),
      checkBoxValue,
      isVerified,
      descriptionController.text,
      image,
    );
  }

  Future<void> getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      update();
    }
  }

  late String pharmacy_id;
  @override
  void onInit() {
    pharmacy_id = Get.arguments['pharmacy_id'];
    // TODO: implement onInit
    super.onInit();
  }

  isClear() {
    nameController.clear();
    dosageController.clear();
    priceController.clear();
    formulaController.clear();
    quantityController.clear();
    isVerified = false;
    checkBoxValue = false;
    image = null;
  }
}
