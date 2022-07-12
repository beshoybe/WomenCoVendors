import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));

    return BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
        builder: (context, state) {
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
                        WomenCoCubitVendors.lang ? "Services" : "خدمات",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        WomenCoCubitVendors.lang
                            ? "Select services that you can provide ."
                            : "إختر الخدمات التي يمكنك توفيرها",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 59.h,
                      ),
                      Center(
                        child: GroupButton(
                            options: GroupButtonOptions(
                              // Buttons Styling
                              borderRadius: BorderRadius.circular(12.0),
                              selectedTextStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              selectedColor: Colors.blue[300],
                              unselectedColor: Colors.grey[300],
                              unselectedTextStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[500],
                              ),
                              buttonHeight: 50.h,
                              buttonWidth: 95.w,
                              textAlign: TextAlign.center,
                              alignment: Alignment.center,
                            ),
                            controller: GroupButtonController(selectedIndex: 0),
                            isRadio:
                                true, //If we want one option only to be selected
                            buttons: WomenCoCubitVendors.lang
                                ? ["Cleaning", "Nursing", "Cooking"]
                                : ["تنظيف", "تمريض", "طبخ"],
                            onSelected: (val, i, selected) {
                              WomenCoCubitVendors.GET(context).selectedService =
                                  val.toString();
                            }),
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      Text(
                        WomenCoCubitVendors.lang ? "Type" : "النوع",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Center(
                        child: GroupButton(
                            options: GroupButtonOptions(
                              // Buttons Styling
                              borderRadius: BorderRadius.circular(12.0),
                              selectedTextStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              selectedColor: Colors.blue[300],
                              unselectedColor: Colors.grey[300],
                              unselectedTextStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[500],
                              ),
                              buttonHeight: 50.h,
                              buttonWidth: 95.w,
                              textAlign: TextAlign.center,
                              alignment: Alignment.center,
                            ),
                            controller: GroupButtonController(selectedIndex: 0),
                            isRadio:
                                true, //If we want one option only to be selected
                            buttons: WomenCoCubitVendors.lang
                                ? ["Home", "Apartment", "Villa"]
                                : ["بيت", "شقة", "فيلا"],
                            onSelected: (val, i, selected) {
                              WomenCoCubitVendors.GET(context)
                                  .selectedServiceType = val.toString();
                            }),
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      Text(
                        WomenCoCubitVendors.lang ? "Zone" : "المنطقة",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      DropdownButton<String>(
                          value: value,
                          items: [
                            DropdownMenuItem(
                              child: Text(WomenCoCubitVendors.lang
                                  ? "Sheikh Zayed"
                                  : "الشيخ زايد"),
                              value: WomenCoCubitVendors.lang
                                  ? "Sheikh Zayed"
                                  : "الشيخ زايد",
                            ),
                            DropdownMenuItem(
                              child: Text(WomenCoCubitVendors.lang
                                  ? "6th of October"
                                  : "السادس من أكتوبر"),
                              value: WomenCoCubitVendors.lang
                                  ? "6th of October"
                                  : "السادس من أكتوبر",
                            )
                          ],
                          onChanged: (val) {
                            value = val;
                          })
                    ],
                  ),
                  WomenCoButton(context,
                      title: WomenCoCubitVendors.lang ? "Continue" : "تابع",
                      onPressed: () {
                    cubit.addService();
                    Navigator.pop(context);
                  }, color: Colors.blue[300])
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}

String? value = WomenCoCubitVendors.lang ? "Governate" : "المحافظة";
