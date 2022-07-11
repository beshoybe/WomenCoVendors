import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/view/subScreens/phoneNumberVerify.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));

    return BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
        builder: (context, states) {
          var cubit = WomenCoCubitVendors.GET(context);
          return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ))),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Your phone number helps people connect with you. ",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/egyFlag.png"),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text("+20",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                        ],
                      ),
                      TextField(
                        controller:
                            WomenCoCubitVendors.GET(context).phoneNumber,
                        decoration: InputDecoration(labelText: "Phone Number"),
                      )
                    ],
                  ),
                  WomenCoButton(context, title: "Continue", onPressed: () {
                    //cubit.AddPhoneNumber();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PhoneNumberVerification()));
                  }, color: Colors.blue[300])
                ],
              ),
            ),
          );
        },
        listener: (context, states) {});
  }
}
