import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class NationalIDScreen extends StatefulWidget {
  const NationalIDScreen({Key? key}) : super(key: key);

  @override
  State<NationalIDScreen> createState() => _NationalIDScreenState();
}

class _NationalIDScreenState extends State<NationalIDScreen> {
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
                        WomenCoCubitVendors.lang
                            ? "National ID"
                            : "الهويه الوطنيه",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        WomenCoCubitVendors.lang
                            ? "Make sure you entered your real nationaal ID"
                            : "تأكد من إدخال هويتك الوطنية الحقيقية",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 77.h,
                      ),
                      TextField(
                        controller: WomenCoCubitVendors.GET(context).nationalID,
                        decoration: InputDecoration(
                            labelText: WomenCoCubitVendors.lang
                                ? "National ID (14 Number)"
                                : "الهويه الوطنيه (14 رقم)"),
                      ),
                    ],
                  ),
                  WomenCoButton(context,
                      title: WomenCoCubitVendors.lang ? "Continue" : "تابع",
                      onPressed: () {
                    cubit.addNationalID();
                    Navigator.pop(context);
                  }, color: Colors.blue[300])
                ],
              ),
            ),
          );
        },
        listener: (context, states) {});
  }
}
