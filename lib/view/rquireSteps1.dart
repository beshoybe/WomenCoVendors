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
                  "Required Steps\n",
                  style: TextStyle(
                      color: Colors.blue[400],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Here’s what you need to do to set up your account.\n",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
            {"Phone Number": WomenCoCubitVendors.GET(context).isPhoneFinished},
            {
              "Personal Picture":
                  WomenCoCubitVendors.GET(context).isPictureFinished
            },
            {"National ID": WomenCoCubitVendors.GET(context).isIDFinished},
            {
              "Criminal Chip":
                  WomenCoCubitVendors.GET(context).isCriminalFinished
            },
            {"Services": WomenCoCubitVendors.GET(context).isServicesFinished}
          ];
          List<dynamic> onPressedFunctions = [
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MobileNumberScreen())),
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
