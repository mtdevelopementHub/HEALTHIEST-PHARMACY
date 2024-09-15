import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:healthiest/models/getRider.dart';
import 'package:healthiest/service/Seller_network.dart';

class GetRiderController extends GetxController {
  List<Rider> gpharmacy = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pharmacy_id = Get.arguments['pharmacy_id'];

    getRider();
  }

  late String pharmacy_id;

  Future getRider() async {
    final data = GetRiderModel.fromJson(
        await SellerNetwork().getRider(pharmacy_id.toString()));

    gpharmacy = data.riders;

    gpharmacy = data.riders;

    update();
  }

  Future<void> riderDelete(String id) async {
    await SellerNetwork().deleteRider(id.toString());
    gpharmacy.removeWhere((ph) => ph.id.toString() == id);
    update();
  }
}
