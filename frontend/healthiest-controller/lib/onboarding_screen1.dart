import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthiest/role_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Color.fromRGBO(2, 85, 91, 100),
            child: Column(
              children: [
                SizedBox(
                  height: 9.h,
                ),
                Image.asset(
                  'assets/Rectangle 37.png',
                  scale: 1.5,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Image.asset('assets/Rectangle 46.png'),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Upload You  Precription',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.grey.shade300),
                ),
                Text(
                  'Order your prescription drugs \n online with only one click',
                  style:
                      TextStyle(fontSize: 17.sp, color: Colors.grey.shade300),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // gesture detector button use  navigate to role screen
                    GestureDetector(
                        onTap: () {
                          Get.off(RoleScreen());
                        },
                        child: Text('Skip',
                            style: TextStyle(color: Colors.grey.shade300))),
                    // gesture detector button use  navigate to role screen

                    GestureDetector(
                      onTap: () {
                        Get.off(RoleScreen());
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.orange.shade400),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/Group 6295.png',
                )
              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(2, 85, 91, 100),
            child: Column(
              children: [
                SizedBox(
                  height: 9.h,
                ),
                Image.asset(
                  'assets/Rectangle 37.png',
                  scale: 1.5,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Image.asset('assets/Rectangle 46 (1).png'),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Certified Medicine',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.grey.shade300),
                ),
                Text(
                  'Licensed Medications that are\n carefully monitored by our\npharmacist',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 17.sp, color: Colors.grey.shade300),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // gesture detector button use  navigate to role screen

                    GestureDetector(
                        onTap: () {
                          Get.off(RoleScreen());
                        },
                        child: Text('Skip',
                            style: TextStyle(color: Colors.grey.shade300))),
                    // gesture detector button use  navigate to role screen

                    GestureDetector(
                        onTap: () {
                          Get.off(RoleScreen());
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.orange.shade400),
                        ))
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/Group 6295.png',
                )
              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(2, 85, 91, 100),
            child: Column(
              children: [
                SizedBox(
                  height: 9.h,
                ),
                Image.asset(
                  'assets/Rectangle 37.png',
                  scale: 1.5,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Image.asset('assets/Rectangle 46 (2).png'),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Quick Delivery',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.grey.shade300),
                ),
                Text(
                  'Receive your medication within just\n a few hours at your doorstep',
                  style:
                      TextStyle(fontSize: 17.sp, color: Colors.grey.shade300),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // gesture detector button use  navigate to role screen

                    GestureDetector(
                        onTap: () {
                          Get.off(RoleScreen());
                        },
                        child: Text('Skip',
                            style: TextStyle(color: Colors.grey.shade300))),
                    // gesture detector button use  navigate to role screen

                    GestureDetector(
                      onTap: () {
                        Get.off(RoleScreen());
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.orange.shade400),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/Group 6295.png',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
