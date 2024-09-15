import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:healthiest/onboarding_screen1.dart';
import 'package:healthiest/role_screen.dart';
import 'package:healthiest/splash_screen.dart';
import 'package:healthiest/templete/Seller/add_medicine_form_screen.dart';
import 'package:healthiest/templete/Seller/add_pharmacy_form_Screen.dart';
import 'package:healthiest/templete/Seller/edit_form_medicine.dart';
import 'package:healthiest/templete/Seller/edit_form_pharmacy_screen.dart';
import 'package:healthiest/templete/Seller/get_medicine_screen.dart';
import 'package:healthiest/templete/Seller/get_order_medicine.dart';
import 'package:healthiest/templete/Seller/get_pharmcy_screen.dart';
import 'package:healthiest/templete/Seller/get_presciption.dart';
import 'package:healthiest/templete/Seller/get_rider_screen.dart';
import 'package:healthiest/templete/Seller/login_screen.dart';
import 'package:healthiest/templete/Seller/seller_rider_foam.dart';
import 'package:healthiest/templete/Seller/signup_screen.dart';

class AppRoutes {
  static String splash = '/';
  static String onBoardingScreen = '/onBoardingScreen';
  static String roleScreen = '/roleScreen';
  static String sellerSignUpScreen = '/sellerSignUpScreen';
  static String sellerLoginScreen = '/sellerLoginScreen';
  static String sellerRiderScreen = '/sellerRiderScreen';
  static String sellerGetPharmacyScreen = '/sellerGetPharmacyScreen';
  static String sellerAddPharmacyScreen = '/sellerAddPharmacyScreen';
  static String sellerEditPharmacyScreen = '/sellerEditPharmacyScreen';
  static String sellerGetMedicineScreen = '/sellerGetMedicineScreen';
  static String sellerAddMedicineScreen = '/sellerAddMedicineScreen';
  static String sellerGetPresciption = '/sellerGetPresciption';
  static String sellerGetOrderScreen = '/sellerGetOrderScreen';
  static String sellerAddRiderScreen = '/sellerAddRiderScreen';
  static String sellerEditMedicineForm = '/sellerEditMedicineForm';

  static List<GetPage<dynamic>> getRoutes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onBoardingScreen, page: () => OnBoarding1()),
    GetPage(name: roleScreen, page: () => RoleScreen()),

    //_________seller_______Secreen______

    GetPage(name: sellerSignUpScreen, page: () => SellerSignUpScreen()),
    GetPage(name: sellerLoginScreen, page: () => SellerLoginScreen()),
    GetPage(name: sellerRiderScreen, page: () => SellerRiderScreen()),
    GetPage(name: sellerGetPharmacyScreen, page: () => GetPharmcyScreen()),
    GetPage(name: sellerAddPharmacyScreen, page: () => AddPharmacyFormScreen()),
    GetPage(name: sellerAddPharmacyScreen, page: () => AddPharmacyFormScreen()),
    GetPage(
        name: sellerEditPharmacyScreen, page: () => EditFromPharmacyScreen()),
    GetPage(name: sellerGetMedicineScreen, page: () => GetMedicineScreen()),
    GetPage(name: sellerAddMedicineScreen, page: () => SellerMedicineForm()),

    GetPage(name: sellerAddPharmacyScreen, page: () => AddPharmacyFormScreen()),
    GetPage(name: sellerGetPresciption, page: () => GetPresciptionScreen()),
    GetPage(name: sellerEditMedicineForm, page: () => EditSellerMedicineForm()),
    GetPage(name: sellerGetOrderScreen, page: () => GetOrderScreen()),
    GetPage(name: sellerRiderScreen, page: () => SellerRiderScreen()),
    GetPage(name: sellerAddRiderScreen, page: () => SellerRiderFoamScreen()),
  ];
}
