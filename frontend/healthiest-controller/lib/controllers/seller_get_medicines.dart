import 'package:get/get.dart';
import 'package:healthiest/models/getmedicineModel.dart';
import 'package:healthiest/service/Seller_network.dart';

class SellerGetMedicineController extends GetxController {
  List<Medicine> gpharmacy = [];

  Future getMedicine() async {
    final data = GetMedicineModel.fromJson(
        await SellerNetwork().getMedicine(pharmacy_id.toString()));

    gpharmacy = data.medicines;

    update();
  }

  void pharmacyId() {
    Get.toNamed('/sellerAddMedicineScreen',
        arguments: {'pharmacy_id': pharmacy_id.toString()});
  }

  late String pharmacy_id;



  @override
  void onInit() {
    pharmacy_id = Get.arguments['pharmacy_id'];
    super.onInit();
    getMedicine();

    // TODO: implement onInit
  }
}
