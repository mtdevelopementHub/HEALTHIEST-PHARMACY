import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthiest/payment_method.dart';
import 'package:healthiest/service/buyer_network.dart';
import 'package:healthiest/templete/Buyer/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderPlaceScreen extends StatefulWidget {
  const OrderPlaceScreen(
      {super.key,
      this.pharmacy_id,
      this.price,
      this.quantity,
      this.image,
      this.name});
  final image;
  final name;
  final pharmacy_id;
  final quantity;
  final price;

  @override
  State<OrderPlaceScreen> createState() => _OrderPlaceScreenState();
}

class _OrderPlaceScreenState extends State<OrderPlaceScreen> {
  String selectedPaymentMethod = 'Cash_on_Delivery';
//YA CONRTROLLER HY SARY FIELD KA
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  late String messageOrderCreate;
//YA  DATA POST HO RAHA HY APIS PR ORDER WALA
  Future orderCreate() async {
    final orderCreate = await BuyerNetwork().orderCreate(
        widget.pharmacy_id,
        nameController.text,
        contactController.text,
        emailController.text,
        ttp.toString(),
        addressController.text,
        widget.quantity,
        selectedPaymentMethod.toString());

    messageOrderCreate = orderCreate['message'];
  }

  late final ttp;

  @override
  Widget build(BuildContext context) {
    ///TOTAL PRICE KI CALCULATION HY
    final totalP = int.tryParse(widget.price) ?? 0;
    final totalQ = int.tryParse(widget.quantity) ?? 0;
    final totalPrice = totalP * totalQ;
    ttp = totalPrice;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(2, 85, 91, 100),
        title: Text(
          'Order Place',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Color.fromRGBO(2, 85, 91, 100),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.h),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: new BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(20))),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: new BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(20))),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: contactController,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: new BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(20))),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: new BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(20))),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(206, 153, 86, 100),
                ),
                height: 18.h,
                width: double.infinity,
                child: Row(
                  children: [
                    Image.network(
                      'https://pharmacy.alruya.link${widget.image.toString()}',
                      width: 10.h,
                      height: 10.h,
                      scale: 4,
                    ),
                    SizedBox(width: 2.h,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' ${widget.name}',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              ' Price: ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' ${widget.price}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              ' Quantity: ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' ${widget.quantity}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 3.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(206, 153, 86, 100),
                      ),
                      height: 15.h,
                      width: 13.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Price: ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' ${totalPrice}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ListTile(
                title: const Text('Cash on Delivery',
                    style: TextStyle(color: Colors.white)),
                leading: Radio<String>(
                  value: 'Cash_on_Delivery',
                  activeColor: Colors.white,
                  fillColor: MaterialStateProperty.all(Colors.white),
                  groupValue: selectedPaymentMethod,
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text(
                  'JazzCash',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Radio<String>(
                  fillColor: MaterialStateProperty.all(Colors.white),
                  value: 'JazzCash',
                  activeColor: Colors.white,
                  groupValue: selectedPaymentMethod,
                  onChanged: (String? value) {
                    print(value);
                    Get.to(PaymentMethodScreen(
                      Price: totalPrice.toString(),
                      contactNumber: '0333344454',
                      name: widget.name,
                    ));
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                ),
              ),
              Container(
                  height: 8.h,
                  width: 44.h,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(206, 153, 86, 100)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color.fromRGBO(
                                              206, 153, 86, 100))))),
                      onPressed: () async {
                        await orderCreate();

                                          BuyerNetwork().getMedicineDefault();


                        await ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(messageOrderCreate.toString()),
                          ),
                        );
                        nameController.clear();
                        contactController.clear();
                        addressController.clear();
                        emailController.clear();
                        Get.to(()=>HomeScreen());
                        // Get.back();
                        // Get.back();
                      },
                      child: Text(
                        'Submit Order',
                        style: TextStyle(
                            color: Color.fromRGBO(2, 85, 91, 100),
                            fontSize: 20.sp),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
