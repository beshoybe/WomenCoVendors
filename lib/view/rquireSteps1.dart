import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';
import 'package:womenco_vendors/view/subScreens/criminalShipScreen.dart';
import 'package:womenco_vendors/view/subScreens/nationalIDScreen.dart';
import 'package:womenco_vendors/view/subScreens/phoneNumberScreen.dart';
import 'package:womenco_vendors/view/subScreens/profilePhotoScreen.dart';
import 'package:womenco_vendors/view/subScreens/servicesScreen.dart';

class RequiredSteps extends StatefulWidget {
  const RequiredSteps({Key? key}) : super(key: key);

  @override
  State<RequiredSteps> createState() => _RequiredStepsState();
}

class _RequiredStepsState extends State<RequiredSteps> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));

    return BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
        builder: (context, states) {
          List<dynamic> titles = [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  WomenCoCubitVendors.lang ? "Required Steps\n" : "خطوات تسجيل",
                  style: TextStyle(
                      color: Colors.blue[400],
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  WomenCoCubitVendors.lang
                      ? "Here’s what you need to do to set up your account.\n"
                      : ".إليك ما عليك القيام به لإعداد حسابك",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
            {
              WomenCoCubitVendors.lang ? "Personal Picture" : "الصوره الشخصية":
                  WomenCoCubitVendors.GET(context).isPictureFinished
            },
            {
              WomenCoCubitVendors.lang ? "National ID" : "البطاقة الشخصية":
                  WomenCoCubitVendors.GET(context).isIDFinished
            },
            {
              WomenCoCubitVendors.lang ? "Criminal Chip" : "الصحيفه الإجراميه":
                  WomenCoCubitVendors.GET(context).isCriminalFinished
            },
            {
              WomenCoCubitVendors.lang ? "Services" : "خدمات":
                  WomenCoCubitVendors.GET(context).isServicesFinished
            }
          ];
          List<dynamic> onPressedFunctions = [
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePhoto())),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => NationalIDScreen())),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CriminalShipScreen())),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ServicesScreen()))
          ];

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
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < 1) {
                        return titles[index];
                      } else {
                        return RequiredTiles(
                            titles[index].keys.single,
                            titles[index].values.single,
                            onPressedFunctions[index - 1]);
                      }
                    },
                    separatorBuilder: (context, index) {
                      if (index < 1) {
                        return Container();
                      } else {
                        return Divider(
                          height: 40,
                          thickness: 2,
                        );
                      }
                    },
                    itemCount: titles.length),
              ));
        },
        listener: (context, states) {});
  }
}
