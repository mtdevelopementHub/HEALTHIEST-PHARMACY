import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthiest/models/buyerMedicineSearchModel.dart';
import 'package:healthiest/service/buyer_network.dart';
import 'package:healthiest/templete/Buyer/addtocart_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MedicineSearch extends StatefulWidget {
  @override
  _MedicineSearchState createState() => _MedicineSearchState();
}

class _MedicineSearchState extends State<MedicineSearch> {
  final TextEditingController _searchController = TextEditingController();
//YA APIS LAGY HY GET KI JO APIS SY SEARCH KARNY PR DATA LAA RAHA HY
  List<Medicine> gMedicines = [];
  Future getMedicine() async {
    final data = MedicineSearchModel.fromJson(
        await BuyerNetwork().buyerMedicineSearch(_searchController.text));

    gMedicines = data.medicines;
    setState(() {
      gMedicines = data.medicines;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(2, 85, 91, 100),
        title: Text('Search Medicines'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(

              controller: _searchController,
              decoration: InputDecoration(
                     border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: getMedicine,
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            gMedicines.isEmpty ? Text("Out of Medicines") :
            Expanded(
                child: GridView.builder(
              itemCount: gMedicines.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                               Get.to(AddToCartScreen(
                              id: gMedicines[index].id.toString(),
                            ));
                  },
                  child: Container(
                    height:50.h,
                    width: 30.w,
                    
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                         
                              ),
                    child: Column(
                      children: [
                        SizedBox(height: 2.h,),
                        Image.network(
                          "https://pharmacy.alruya.link${gMedicines[index].image.toString()}",
                          width: 70,
                          height: 70,
                        ),
                        Text(gMedicines[index].name.toString())
                      ],
                    ),
                  ),
                );
              },
            )),

            //  ListView.builder(
            //     itemCount: gMedicines.length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         height: 50.h,
            //         child: Column(
            //           children: [
            //             Image.network(
            //               "https://pharmacy.alruya.link${gMedicines[index].image.toString()}",
            //               width: 70,
            //               height: 70,
            //             ),
            //             Text(gMedicines[index].name.toString())
            //           ],
            //         ),
            //     );
            //   }),
          ],
        ),
      ),
    );
  }
}
