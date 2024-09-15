import 'dart:async';

import 'package:get/get.dart';
import 'package:healthiest/models/getPharmacyModel.dart';
import 'package:healthiest/service/Seller_network.dart';

class SellerGetPharmacyController extends GetxController {
  List<Pharmacy> gpharmacy = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPharmacy();

    
  }

Future <void> deletePharmcy( String id ) async{
  
  await SellerNetwork().deletePharmcy(id.toString());
  gpharmacy.removeWhere((ph)=>ph.id.toString() == id);
  update();

}
  

  Future getPharmacy() async {
    final data = GetPharmacy.fromJson(await SellerNetwork().getPharmcy());

    gpharmacy = data.pharmacies;

    gpharmacy = data.pharmacies;

    update();
  }
}
