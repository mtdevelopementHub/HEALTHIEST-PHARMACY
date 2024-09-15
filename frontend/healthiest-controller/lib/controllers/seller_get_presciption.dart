import 'package:get/get.dart';
import 'package:healthiest/models/presciptionMedicine.dart';
import 'package:healthiest/service/Seller_network.dart';

class SellerGetPresciption extends GetxController {
  late String medicine_id;

  List<Prescription> gpharmacy = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    medicine_id = Get.arguments['medicine_id'];
    getPreciption();
  }

  Future getPreciption() async {
    final data = PresciptionModel.fromJson(
        await SellerNetwork().getMedicinePresciption(medicine_id.toString()));

    gpharmacy = data.prescriptions;

    update();
  }
}
