import 'package:flutter/material.dart';
import 'package:healthiest/models/medicineDefalutModel.dart';
import 'package:healthiest/service/buyer_network.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  List<Medicine> gpharmacy = [];
//YA DEFAULT MEDICINE GET HIO RAHI HY
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Color.fromRGBO(2, 85, 91, 100),
        title: Text('Medicine Default'),
      ),
      body: ListView.builder(
          itemCount: gpharmacy.length,
          itemBuilder: (contex, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(
                children: [
                  SizedBox(height: 1.h,),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(gpharmacy[index].name.toString()),
                    subtitle: Text(gpharmacy[index].dosage.toString()),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Quantity: ${gpharmacy[index].quantity}"),
                        Text("Rs: ${gpharmacy[index].price}"),
                      ],
                    ),
                    //     Text("Rs: ${gpharmacy[index].price}")
                  ),
                  SizedBox(
                    height: 1.h,
                  )
                ],
              ),
            );
          }),
    );
  }
}
