import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:womenco_vendors/shared/component/components.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';

class CriminalShipScreen extends StatefulWidget {
  const CriminalShipScreen({Key? key}) : super(key: key);

  @override
  State<CriminalShipScreen> createState() => _CriminalShipScreenState();
}

class _CriminalShipScreenState extends State<CriminalShipScreen> {
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
            bottomSheet: isCriminalBottomSheetOpened
                ? BottomSheet(
                    backgroundColor: Colors.white,
                    enableDrag: false,
                    elevation: 0,
                    onClosing: () {},
                    builder: (context) => Container(
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await ImagePicker().pickImage(
                                            source: ImageSource.camera);
                                      },
                                      icon: Icon(
                                        Icons.camera_alt,
                                      )),
                                  Text(WomenCoCubitVendors.lang
                                      ? "Take a photo"
                                      : "إلتقط الصوره ")
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await ImagePicker().pickImage(
                                            source: ImageSource.gallery);
                                      },
                                      icon: Icon(Icons.photo)),
                                  Text(
                                    WomenCoCubitVendors.lang
                                        ? "Choose from\ngallery"
                                        : "إختر من الأستوديو",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                : null,
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 30, right: 30, bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        WomenCoCubitVendors.lang
                            ? "Criminal Ship"
                            : "الصحيفه الإجراميه",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        WomenCoCubitVendors.lang
                            ? "Make sure all information is readable, not blurry and that all corners of the document are visible"
                            : "تأكد من أن جميع المعلومات قابلة للقراءة وليست ضبابية وأن جميع أركان المستند مرئية",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 91.h,
                      ),
                      Center(
                          child: Image.asset(
                        "assets/criminalShip.png",
                        width: 222.w,
                        height: 322.h,
                      ))
                    ],
                  ),
                  WomenCoButton(context,
                      title: WomenCoCubitVendors.lang
                          ? "Take Photo"
                          : "إلتقط الصوره", onPressed: () {
                    setState(() {
                      isCriminalBottomSheetOpened =
                          !isCriminalBottomSheetOpened;
                    });
                    // cubit.addCriminalChip();
                    // Navigator.pop(context);
                  }, color: Colors.blue[200])
                ],
              ),
            ),
          );
        },
        listener: (context, states) {});
  }
}

bool isCriminalBottomSheetOpened = false;
