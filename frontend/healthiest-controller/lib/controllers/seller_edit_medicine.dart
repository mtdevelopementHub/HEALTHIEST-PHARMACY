import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:healthiest/service/Seller_network.dart';
import 'package:image_picker/image_picker.dart';

class SellerEditMedicineFormController extends GetxController {
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

  Future<void> updateMedicine() async {
    final medicine = await SellerNetwork().updateMedicine(
      pharmacy_id.toString(),
      medicine_id.toString(),
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
   String? pharmacy_id;
   String? medicine_id;
   String? name;
   String? dosage;
   String? price;
   String? formula;
   String? quantity;
   String? categoryId;
   int? status;
   int? isverified;
   String? description; 
   String? imageW;

  @override
  void onInit() {
    pharmacy_id = Get.arguments['pharmacy_id'];
    medicine_id = Get.arguments['medicine_id'];
    name = Get.arguments['medicine_name'];
    dosage = Get.arguments['medicine_dosage'];
    price = Get.arguments['medicine_price'];
    formula = Get.arguments['medicine_formula'];
    quantity = Get.arguments['medicine_quantity'];
    categoryId  = Get.arguments['medicine_category'];
    status = Get.arguments['medicine_status'];
    isverified = Get.arguments['medicine_isverified'];
    description = Get.arguments['medicine_description'];
    imageW = Get.arguments['medicine_image'];
    // TODO: implement onInit
    super.onInit();
    getDataMedicine();
       tablet_id = categoryId.toString(); // Initialize tablet_id with a default value or from another source
    selectedItem1 = keyValueMap.keys.firstWhere(
        (k) => keyValueMap[k] == tablet_id,
        orElse: () => items[0]); 
  }

  getDataMedicine(){
    nameController.text = name.toString();
    dosageController.text = dosage.toString();
    priceController.text = price.toString();
    formulaController.text = formula.toString();
    quantityController.text = quantity.toString();
    descriptionController.text = description.toString();
    tablet_id = categoryId.toString();
    checkBoxValue = status == 0 ? false: true;
    isVerified = isverified == 0 ? false:true;
    update(); 
   // image = imageW ;

  }




  // isClear() {
  //   nameController.clear();
  //   dosageController.clear();
  //   priceController.clear();
  //   formulaController.clear();
  //   quantityController.clear();
  //   isVerified = false;
  //   checkBoxValue = false;
  //   image = null;
  // }





}
