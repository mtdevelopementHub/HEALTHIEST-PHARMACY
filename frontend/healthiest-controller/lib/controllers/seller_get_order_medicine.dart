import 'package:get/get.dart';
import 'package:healthiest/models/getOrderMedicine.dart';
import 'package:healthiest/service/Seller_network.dart';

class SellerGetOrderMedicine extends GetxController {
  late String pharmacy_id;

  List<Order> gpharmacy = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pharmacy_id = Get.arguments['pharmacy_id'];
    getOrder();
  }

  Future getOrder() async {
    final data = GetOrderModel.fromJson(
        await SellerNetwork().getOrderMedicine(pharmacy_id.toString()));

    gpharmacy = data.orders;

    update();
  }
}
