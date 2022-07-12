import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
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
                        WomenCoCubitVendors.lang!
                            ? "National ID"
                            : "الهويه الوطنيه",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        WomenCoCubitVendors.lang!
                            ? "Make sure you entered your real nationaal ID"
                            : "تأكد من إدخال هويتك الوطنية الحقيقية",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 77.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          cubit.frontId == null
                              ? Center(
                                  child: IconButton(
                                      iconSize: 30,
                                      onPressed: () async {
                                        await ImagePicker()
                                            .pickMultiImage()
                                            .then((value) {
                                          setState(() {
                                            cubit.frontId =
                                                File(value![0].path);
                                            cubit.backId = File(value[1].path);
                                          });
                                        });
                                      },
                                      icon: Icon(Icons.add_a_photo)),
                                )
                              : Screenshot(
                                  controller: fullIdScreenShot,
                                  child: Row(
                                    children: [
                                      Image.file(
                                        cubit.frontId as File,
                                        width: 100,
                                      ),
                                      Image.file(
                                        cubit.backId as File,
                                        width: 100,
                                      )
                                    ],
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                  WomenCoButton(context,
                      title: WomenCoCubitVendors.lang! ? "Continue" : "تابع",
                      onPressed: () async {
                    var directory = await getApplicationDocumentsDirectory();
                    fullIdScreenShot
                        .captureAndSave("$directory/WomenCo_ID_Image.png")
                        .then((value) {
                      cubit.fullID = File(value.toString());
                    });
                    // cubit.addNationalID();
                    // Navigator.pop(context);
                  }, color: Colors.blue[300])
                ],
              ),
            ),
          );
        },
        listener: (context, states) {});
  }
}

ScreenshotController fullIdScreenShot = ScreenshotController();
