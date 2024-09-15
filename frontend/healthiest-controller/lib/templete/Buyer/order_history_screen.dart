import 'package:flutter/material.dart';
import 'package:healthiest/models/orderHistoryMedicine.dart';
import 'package:healthiest/service/buyer_network.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<Order> orderHistory = [];
//YA DEFAULT MEDICINE GET HIO RAHI HY
  Future getPharmacy() async {
    final data = OrderHistoryModel.fromJson(
        await BuyerNetwork().getOrderHistory());

    orderHistory = data.orders;
    setState(() {
      orderHistory = data.orders;
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
        title: Text('Order History'),
      ),
      body: orderHistory.isEmpty ?Center(child: Text('No History',)) :
      ListView.builder(
          itemCount: orderHistory.length,
          itemBuilder: (contex, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(
                children: [
                  SizedBox(height: 1.h,),
                    Container(
                        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
          border: Border(
              left: BorderSide(
                  color: Colors.green,
                  width: 3,
              ),
            ),
          ),
                      child: 
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Row(
                          children: [
                            Text('Order#: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(orderHistory[index].orderNumber.toString()),
                          ],
                        ),
                         Row(
                          children: [
                            Text('Name: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(orderHistory[index].name.toString()),
                          ],
                        ),
                         Row(
                          children: [
                            Text('Contact#: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(orderHistory[index].contactNo.toString()),
                          ],
                        ),
                         Row(
                          children: [
                            Text('email: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(orderHistory[index].email.toString()),
                          ],
                        ),
                           Row(
                          children: [
                            Text('Quantity: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(orderHistory[index].quantity.toString()),
                          ],
                        ),
                            Row(
                          children: [
                            Text('Price: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(orderHistory[index].price.toString()),
                          ],
                        ),
                            Row(
                          children: [
                            Text('Medicine Name: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(orderHistory[index].medicine.toString()),
                          ],
                        ),
                            Row(
                          children: [
                            Text('Pharmacy Name: ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                            Text(orderHistory[index].pharmacy.toString()),
                          ],
                        )
                      ],),
                    )
                    
                    ,),
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