import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthiest/models/buyerCategoriesMedicine.dart';
import 'package:healthiest/models/buyerNearBy.dart';
import 'package:healthiest/models/buyerViewMedicine.dart';
import 'package:healthiest/models/medicineDefalutModel.dart';
import 'package:healthiest/role_screen.dart';
import 'package:healthiest/service/buyer_network.dart';
import 'package:healthiest/templete/Buyer/addtocart_screen.dart';
import 'package:healthiest/templete/Buyer/order_history_screen.dart';
import 'package:healthiest/templete/Buyer/search_nearby_medicine.dart';
import 'package:healthiest/templete/Buyer/search_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.name, this.email});

  final name;
  final email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// latitude and logitude hy
  double latitude = 0.0;
  double longitude = 0.0;
//ya sb mobile permission lagy huihy
  void requestPermissions() async {
    Map<permission_handler.Permission, permission_handler.PermissionStatus>
        statuses = await [
      permission_handler.Permission.location,
      permission_handler.Permission.locationAlways,
      permission_handler.Permission.locationWhenInUse,
    ].request();

    if (statuses[permission_handler.Permission.locationAlways]!.isGranted) {
      _getLocation();
    } else {}
  }

   LocationData? _currentLocation;
  Location location = Location();
  late StreamSubscription<LocationData> _locationSubscription;
//y LIST GET HO RAHI HY NEARBY KI
  List<Medicine2> nearBy = [];

  ///Ya method hy latitde and logitude hm dy rahy hn apis ko jis sy data arha hy
  ///
  ///
  ///
//
  void _getLocation() async {
    try {
      var currentLocation = await location.getLocation();
      setState(() {
        _currentLocation = currentLocation;
        print(_currentLocation!.latitude);
        print(_currentLocation!.longitude);
      });
      final near = NearByModel.fromJson(await BuyerNetwork().buyerNearLocation(
          _currentLocation!.latitude!.toDouble(),
          _currentLocation! .longitude!.toDouble()));

      setState(() {
        nearBy = near.medicines;
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void _startLocationUpdates() {
    _locationSubscription =
        location.onLocationChanged.listen((LocationData locationData) {
      setState(() {
        _currentLocation = locationData;
      });
    });

    // Periodically update location every 5 minutes
    //   Timer.periodic(Duration(seconds: 20), (timer) {
    _getLocation();
    //  });
  }

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

  String selectedItem1 = 'Liquid';
  //String? key;

  //ya filtering wala option jo hy aska liya apiss sy data araha hy
  List<Medicine1> gMedicinesFlitering = [];
  Future getMedicine(String id) async {
    final data = BuyerCategoryMedicine.fromJson(
        await BuyerNetwork().buyerCategoryMedicines(id.toString()));

    gMedicinesFlitering = data.medicines;
    setState(() {
      gMedicinesFlitering = data.medicines;
    });
  }

// --------------------Meidicine GEt
  List<Medicine> gpharmacy = [];

  Future getPharmacy() async {
    final data = MedicineDefaultModel.fromJson(
        await BuyerNetwork().getMedicineDefault());

    gpharmacy = data.medicines;
    setState(() {
      gpharmacy = data.medicines;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPharmacy();
  }

  bool _isClick = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false   ,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(2, 85, 91, 100),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(2, 85, 91, 100),
          title: Image.asset(
            'assets/Rectangle 37.png',
            scale: 1.4,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(MedicineSearch());
              },
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.lock,
              color: Colors.white,
            )
          ],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Container(
          width: 30.h,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Image.asset(
                'assets/images.png',
                width: 20.h,
                height: 20.h,
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(),
              SizedBox(
                height: 1.h,
              ),
              Text(
                widget.name.toString(),
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              Divider(),
              Text(widget.email.toString(),
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 1.h,
              ),
              Divider(),
              GestureDetector(
                  onTap: () {
                    Get.to(()=>OrderHistoryScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bookmark_outline),
                      Text(
                        'Order History',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              SizedBox(
                height: 1.h,
              ),
              Divider(),
              GestureDetector(
                  onTap: () async {
                    await BuyerNetwork().buyerLogout();
                    Get.offAll(RoleScreen());
                  },
                  child: Icon(Icons.logout))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _startLocationUpdates();
                },
                child:_currentLocation==null ? Icon(Icons.location_off): Icon(Icons.location_on),
                //  Image.asset(
                //   'assets/markerIcon.png',
                //   scale: 4,
                // )
              ),
              SizedBox(height: 1.h,),
              Text("MEDICINE ACCORDING TO CLOSEST PHARMACY",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 1.h,),
              Container(
                color: Color.fromRGBO(51, 60, 65, 100),
                height: 34.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.h), 
                  child: nearBy.isEmpty
                      ? Center(
                          child: Text(
                          "No medicines found near your location.",
                          style: TextStyle(fontSize: 17.sp, color: Colors.white),
                        ))
                      : Column(
                          children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(()=>NearBySearchMedicineScreen(
                                        nearByList: nearBy,
                                      ));
                                    },
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ))),
                            Container(
                              color: Colors.white,
                              height: 30.h,
                              width: double.infinity,
                              child: ListView.builder(
                                  //  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  //  scrollDirection: Axis.horizontal,
                                  itemCount: nearBy.length,
                                  itemBuilder: (contex, index) {
                                    return Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(()=>AddToCartScreen(
                                              id: nearBy[index].id.toString(),
                                            ));
                                          },
                                          child: Container(
                                            color: Colors.grey,
                                            height: 25.h,
                                            width: 17.h,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.network(
                                                  "https://pharmacy.alruya.link${nearBy[index].image.toString()}",
                                                  width: 70,
                                                  height: 70,
                                                ),
                                                Text(
                                                  nearBy[index].name.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                    nearBy[index]
                                                        .dosage
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                Text(
                                                    "Quantity: ${nearBy[index].quantity}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                Text("Rs: ${nearBy[index].price}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.h,
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
      Text("NEW ARRIVEL",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      SizedBox(height: 1.h,),
              Container(
                height: 25.h,
                width: double.infinity,
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: gpharmacy.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              print(gpharmacy[index].id.toString());
                              Get.to(()=>AddToCartScreen(
                                id: gpharmacy[index].id.toString(),
                              ));
      
                              final viewMedicine = ViewMedicineModel.fromJson(
                                  await BuyerNetwork().buyerViewMedicine(
                                      gpharmacy[index].id.toString()));
      
                              // setState(() {});
                            },
                            child: Container(
                              height: 22.h,
                              width: 15.h,
                              color: Colors.grey,
                              child: Column(
                                children: [
                                  Image.network(
                                    "https://pharmacy.alruya.link${gpharmacy[index].image.toString()}" ??
                                        '',
                                    width: 60,
                                    height: 60,
                                  ),
                                  Text(
                                    gpharmacy[index].name.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(gpharmacy[index].dosage.toString(),
                                      style: TextStyle(color: Colors.black)),
                                  Text("Quantity: ${gpharmacy[index].quantity}",
                                      style: TextStyle(color: Colors.black)),
                                  Text("Rs: ${gpharmacy[index].price}",
                                      style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.h,
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(height: 1.h,),
              Text("FLITER MEDICINE",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white,fontWeight: FontWeight.bold)),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: DropdownButton<String>(
                      value: selectedItem1,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedItem1 = newValue!;
                          print(selectedItem1);
                        });
                        // Get the value corresponding to the selected key
                        String selectedValue = keyValueMap[newValue]!;
      
                        final key = selectedValue;
                        print(key);
      
                        getMedicine(key.toString());
                        //  String key= keyValueMap[newValue!];
                        print('Selected Value: $selectedValue');
                      },
                      items: items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              gMedicinesFlitering.isEmpty
                  ? Center(
                      child: Text(
                      "This Category Out of Stock",
                      style: TextStyle(fontSize: 17.sp, color: Colors.white),
                    ))
                  : Container(
                      height: 25.h,
                      width: double.infinity,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: gMedicinesFlitering.length,
                          itemBuilder: (contex, index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Get.to(AddToCartScreen(
                                    //   id: gMedicines[index].id.toString(),
                                    // ));
                                    Future getPharmacy() async {
                                      final viewMedicine = Medicine5.fromJson(
                                          await BuyerNetwork().buyerViewMedicine(
                                              gMedicinesFlitering[index]
                                                  .id
                                                  .toString()));
      
                                      setState(() {});
                                    }
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(AddToCartScreen(
                                        id: gMedicinesFlitering[index]
                                            .id
                                            .toString(),
                                      ));
                                    },
                                    child: Container(
                                      height: 22.h,
                                      width: 15.h,
                                      color: Colors.grey,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            "https://pharmacy.alruya.link${gMedicinesFlitering[index].image.toString()}",
                                            width: 60,
                                            height: 60,
                                          ),
                                          Text(
                                            gMedicinesFlitering[index]
                                                .name
                                                .toString(),
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                              gMedicinesFlitering[index]
                                                  .dosage
                                                  .toString(),
                                              style:
                                                  TextStyle(color: Colors.black)),
                                          Text(
                                              "Quantity: ${gMedicinesFlitering[index].quantity}",
                                              style:
                                                  TextStyle(color: Colors.black)),
                                          Text(
                                              "Rs: ${gMedicinesFlitering[index].price}",
                                              style:
                                                  TextStyle(color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.h,
                                )
                              ],
                            );
                          }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeeklyDealCard extends StatelessWidget {
  const WeeklyDealCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/Layer 1 (2) 3.png',
          scale: 4,
        ),
        Text("Accu-chek \n Istant Kit",
            style: TextStyle(fontSize: 13.sp, color: Colors.white)),
        Text("Rs. 37.00",
            style: TextStyle(fontSize: 13.sp, color: Colors.white)),
        Text("Rs. 47.00",
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.white,
              decoration: TextDecoration.lineThrough,
            )),
      ],
    );
  }
}

// class CartCard extends StatelessWidget {
//   CartCard(
//       {super.key,
//       this.name,
//       this.price,
//       this.tablet,
//       this.image,
//       this.quantity});
//   final image;
//   final name;
//   final tablet;
//   final price;
//   final quantity;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       // crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.network(
//           image,
//           height: 60,
//           width: 90,
//         ),
//         Text(name),
//         Text(tablet),
//         Text("Rs: ${price}", style: TextStyle(fontSize: 13.sp)),
//         Container(
//           height: 4.h,
//           width: 12.h,
//           decoration: new BoxDecoration(
//               color: Color.fromRGBO(206, 153, 86, 100),
//               borderRadius: new BorderRadius.all(new Radius.circular(30))),
//           child: Center(
//               child: GestureDetector(
//                   onTap: () {
//                     Get.to(AddToCartScreen(
//                       image: image,
//                       name: name,
//                       quantity: quantity,
//                       price: price,
//                     ));
//                   },
//                   child: Text(
//                     'Add to Cart',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 13.sp, color: Colors.white),
//                   ))),
//         ),
//       ],
//     );
//   }
// }
