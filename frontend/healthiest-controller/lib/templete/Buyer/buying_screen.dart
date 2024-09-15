import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuyingScreen extends StatefulWidget {
  const BuyingScreen({super.key});

  @override
  State<BuyingScreen> createState() => _BuyingScreenState();
}

class _BuyingScreenState extends State<BuyingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Check Out'),
      ),
      body: Column(children: [
           Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(20))),
                  child: TextFormField(
                   //   controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      )),
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
                //      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      )),
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
                  //    controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      )),
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
                   //   controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      )),
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
                 //     controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),

      ],),
    );
  }
}