import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jazzcash_flutter/jazzcash_flutter.dart';



class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen(
      {super.key,
      this.Price,
      this.contactNumber,
      this.name
      });

      final name;
      final Price;
      final contactNumber;
 
  @override
  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
 // final appointmentController = Get.put(CreateAppointmentController());
 // final doctorController = Get.put(DoctorController());
//  final doctorscheduleController = Get.put(DoctorSchedulesController());
  String paymentStatus = "pending";
  // ProductModel productModel =
  String integritySalt = "17vt285ytb";
  String merchantID = "MC57097";
  String merchantPassword = "u0w0953419";
  String transactionUrl =
      "https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction";

  get index => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Jazz Cash",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor:Color.fromRGBO(2, 85, 91, 100),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Medicine Name :${widget.name}",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Seller Number :${widget.contactNumber}",
              style: TextStyle(fontSize: 20),
            ),
          
            const SizedBox(
              height: 20,
            ),
            Text(
              "Total Price :${widget.Price} ",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 230,
            ),
            SizedBox(
              height: (50),
              width:(160),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  onPressed: () async {
                    _payViaJazzCash(
                        ProductModel("totalPrice",widget.Price
                           ),
                        context);
                  },
                  child: const Text(
                    "Payment Now ",
                    style: TextStyle(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future _payViaJazzCash(ProductModel element, BuildContext c) async {
    //print("clicked on Product ${element.name}");

    try {
      JazzCashFlutter jazzCashFlutter = JazzCashFlutter(
        merchantId: merchantID,
        merchantPassword: merchantPassword,
        integritySalt: integritySalt,
        isSandbox: true,
      );

      DateTime date = DateTime.now();

      JazzCashPaymentDataModelV1 paymentDataModelV1 =
          JazzCashPaymentDataModelV1(
        ppAmount: '${element.totalPrice}',
        ppBillReference:
            'refbill${date.year}${date.month}${date.day}${date.hour}${date.millisecond}',
        ppDescription:
            'Product details  ${element.medicineName} - ${element.totalPrice}',
        ppMerchantID: merchantID,
        ppPassword: merchantPassword,
        ppReturnURL: transactionUrl,
      );

      jazzCashFlutter
          .startPayment(
              paymentDataModelV1: paymentDataModelV1, context: context)
          .then((_response) async {
        print("response from jazzcash $_response");

        // _checkIfPaymentSuccessfull(_response, element, context).then((res) {
        //   // res is the response you returned from your return url;
        //   return res;
        // });
        // await appointmentController.uploadData(
        //     status: "book",
        //     patientID: widget.patientModel.userID,
        //     doctorID: widget.doctorModel.userID,
        //     sheduleID: widget.doctorScheduleModel.userID
        //     );

        // await appointmentController.fetchData();
        // Utils().toastMessage("BOOKED");
               ScaffoldMessenger.of(context).showSnackBar(
         await   SnackBar(
            content: Text('Successfully Payment Recieved'),
          ),
        );
        setState(() {});
        Get.back();
        
      });
    } catch (err) {
      print("Error in payment $err");
      // CommonFunctions.CommonToast(
      //   message: "Error in payment $err",
      // );
      return false;
    }
  }
}

class ProductModel {
  String? medicineName;
  String? totalPrice;

  ProductModel(this.medicineName, this.totalPrice);
}