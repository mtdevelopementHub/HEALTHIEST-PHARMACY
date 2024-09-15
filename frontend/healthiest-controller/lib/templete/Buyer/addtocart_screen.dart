import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/models/buyerViewMedicine.dart';
import 'package:healthiest/service/buyer_network.dart';
import 'package:healthiest/templete/Buyer/order_place.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddToCartScreen extends StatefulWidget {
  final id;

  AddToCartScreen({
    super.key,
    required this.id,
  });

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  final TextEditingController imageUrlController = TextEditingController();

//itState ya state screen my sb sy phly chalti hy

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //asy liya medicine sy get ho rhai hy ya phly apis sy
    getPharmacy();
  }

//variable hy
  var vMedicine;
  //ya mehod hy get ka apis sy data arha hy asy hm id bhaj rahy hn 
  Future getPharmacy() async {
    final viewMedicine = ViewMedicineModel.fromJson(
        await BuyerNetwork().buyerViewMedicine(widget.id.toString()));
    vMedicine = await viewMedicine.medicine;

    setState(() {});
  }

  late final message;
//ya presciption upLOad ka method hy id apis ko dy rahy hn as my bhi hm
  Future uploadPresciption() async {
    final img =
        await BuyerNetwork().presciptionUpload(widget.id.toString(), image);
    message = img;
    print(message);
  }

  File? image;
///ya image get ka method hy
  Future<void> getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      setState(() {});
    }
  }

  int selectedQuantity = 1;
//increaseQuantity ka method hy
  void increaseQuantity() {
    int maxQty = int.tryParse(vMedicine.quantity.toString()) ?? 0;
    setState(() {
      if (selectedQuantity < maxQty) {
        selectedQuantity++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Maximum quantity reached'),
          ),
        );
      }
    });
  }
//decreaseQuantity k METHOd hy
  void decreaseQuantity() {
    setState(() {
      if (selectedQuantity > 1) {
        selectedQuantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //    int maxQty = int.tryParse(  vMedicine.quantity.toString()) ?? 0;

    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            Icon(
              Icons.lock,
              color: Colors.white,
            )
          ],
        ),
        body: vMedicine == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  //yA Image get ki hy
                  Image.network(
                    'https://pharmacy.alruya.link${vMedicine.image.toString()}',
                    width: 40.h,
                    height: 48.h,
                    scale: 4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(45.0),
                          topLeft: Radius.circular(45.0)),
                      color: Color.fromRGBO(2, 85, 91, 100),
                    ),
                    height: 40.h,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            //ya nam get ki hy
                            Row(
                              children: [
                                Text(
                                  "Name: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " ${vMedicine.name.toString()}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                            //price get hy
                            Row(
                              children: [
                                Text(
                                  "PKR: ",
                                  style: TextStyle(
                                      color: Colors.grey.shade200,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${vMedicine.price.toString()}",
                                  style: TextStyle(
                                    color: Colors.grey.shade200,
                                    fontSize: 17.sp,
                                  ),
                                ),
                              ],
                            ),
                            //pharmy get
                            Row(
                              children: [
                                Text("Pharmacy: ",
                                    style: TextStyle(
                                        color: Colors.grey.shade200,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold)),
                                Text(" ${vMedicine.pharmacy.name.toString()}",
                                    style: TextStyle(
                                      color: Colors.grey.shade200,
                                      fontSize: 17.sp,
                                    )),
                              ],
                            ),
                          //area get
                            Row(
                              children: [
                                Text("Area: ",
                                    style: TextStyle(
                                        color: Colors.grey.shade200,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    " ${vMedicine.pharmacy.location.toString()}",
                                    style: TextStyle(
                                      color: Colors.grey.shade200,
                                      fontSize: 17.sp,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Quantity: ",
                                  style: TextStyle(
                                    color: Colors.grey.shade200,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " ${int.tryParse(vMedicine.quantity.toString()) ?? 0}",
                                  style: TextStyle(
                                    color: Colors.grey.shade200,
                                    fontSize: 17.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(206, 153, 86, 100),
                                  ),
                                  height: 5.h,
                                  width: 5.h,
                                  child: IconButton(
                                    icon:
                                        Icon(Icons.remove, color: Colors.white),
                                    onPressed: decreaseQuantity,
                                  ),
                                ),
                                SizedBox(width: 2.h),
                                Text(
                                  '$selectedQuantity',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 2.h),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromRGBO(206, 153, 86, 100),
                                  ),
                                  height: 5.h,
                                  width: 5.h,
                                  child: IconButton(
                                    icon: Icon(Icons.add, color: Colors.white),
                                    onPressed: increaseQuantity,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 2.h,
                            ),


                              Align(
                                    alignment: Alignment.centerLeft,
                                     child: Text(
                                      'Description:',
                                      style: TextStyle(
                                        color: Colors.grey.shade200,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold
                                      ),
                                                                       ),
                                   ),

                                  Text(
                                    vMedicine.description.toString(),
                                    style: TextStyle(
                                      color: Colors.grey.shade200,
                                      fontSize: 17.sp,
                                    ),
                                  ),





                            SizedBox(
                              height: 2.h,
                            ),
                            Column(
                              children: [
                                SizedBox(height: 20),
                                if (image != null)
                                  Image.file(
                                    image!,
                                    height: 100,
                                  ),
                                if (vMedicine.isVerified == 1 && image == null)
                                  Column(
                                    children: [
                                      Text(
                                        'Please provide a prescription',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color: Color.fromRGBO(
                                                  206, 153, 86, 100),
                                            ),
                                            height: 5.h,
                                            width: 5.h,
                                            child: IconButton(
                                              icon: Icon(Icons.image),
                                              onPressed: getImage,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.h,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                 



                                SizedBox(
                                  height: 2.h,
                                ),






                                image == null
                                    ? Text('')
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color:
                                              Color.fromRGBO(206, 153, 86, 100),
                                        ),
                                        height: 5.h,
                                        width: 5.h,
                                        child: IconButton(
                                          icon: Icon(Icons.upload),
                                          onPressed: () async {
                                            await uploadPresciption();
                                            if (message['status'] == true) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content:
                                                      Text(message['message']),
                                                ),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content:
                                                      Text(message['message']),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                SizedBox(
                                  height: 2.h,
                                ),









                                if (vMedicine.isVerified == 0 ||
                                    (vMedicine.isVerified == 1 &&
                                        image != null))
                                  Container(
                                    height: 8.h,
                                    width: 44.h,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color.fromRGBO(206, 153, 86, 100),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Color.fromRGBO(
                                                    206, 153, 86, 100)),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        Get.to(()=>OrderPlaceScreen(
                                          quantity: selectedQuantity.toString(),
                                          pharmacy_id: widget.id.toString(),
                                          price: vMedicine.price.toString(),
                                          image: vMedicine.image.toString(),
                                          name: vMedicine.name.toString(),
                                        ));
                                      },
                                      child: Text(
                                        'Order Place',
                                        style: TextStyle(
                                          color: Color.fromRGBO(2, 85, 91, 100),
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
