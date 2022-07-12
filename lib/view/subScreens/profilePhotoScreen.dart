import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
        builder: (context, states) {
          var cubit = WomenCoCubitVendors.GET(context);
          return Scaffold(
            bottomSheet: isBottomSheetOpened
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
                                        await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera)
                                            .then((value) {
                                          setState(() {
                                            cubit.profileImage =
                                                File(value!.path);
                                          });
                                        });
                                      },
                                      icon: Icon(
                                        Icons.camera_alt,
                                      )),
                                  Text("Take a photo")
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery)
                                            .then((value) {
                                          setState(() {
                                            cubit.profileImage =
                                                File(value!.path);
                                          });
                                        });
                                      },
                                      icon: Icon(Icons.photo)),
                                  Text(
                                    WomenCoCubitVendors.lang
                                        ? "Choose from\ngallery"
                                        : "اختر من الاستوديو",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                : null,
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
              padding: const EdgeInsets.only(
                  top: 30, bottom: 100, left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            WomenCoCubitVendors.lang
                                ? "Take your profile photo\n"
                                : "إلتقط الصوره الآن",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(
                            WomenCoCubitVendors.lang
                                ? "Your profile photo helps people recognize you. Please note that once you submit your profile photo it cannot be changed.\n\n"
                                : "تساعد صورة ملفك الشخصي الأشخاص في التعرف عليك. يرجى ملاحظة أنه بمجرد إرسال صورة ملفك الشخصي لا يمكن تغييرها.",
                            style: TextStyle(fontSize: 18)),
                        Text(
                            WomenCoCubitVendors.lang
                                ? """
1 Face the camera directly with your eyes and mouth clearly visible.
2 Make sure the photo is well lit, free of glare and in focus.
3 No photos of a photo, filters, or alterations."""
                                : """
1 وجه الكاميرا مباشرة مع رؤية عينيك وفمك بوضوح.
2 تأكد من أن الصورة مضاءة جيدًا وخالية من الوهج ومركزة.
3 لا توجد صور للصورة أو المرشحات أو التعديلات.
""",
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ]),
                  cubit.profileImage == null
                      ? Container()
                      : Container(
                          child: Image.file(cubit.profileImage as File),
                          width: 120,
                        ),
                  WomenCoButton(context,
                      title: WomenCoCubitVendors.lang
                          ? "Take Photo"
                          : "إلتقط الصوره", onPressed: () {
                    setState(() {
                      isBottomSheetOpened = !isBottomSheetOpened;
                      // cubit.addProfileImage();
                      // Navigator.pop(context);
                    });
                  }, color: Colors.blue[200]),
                ],
              ),
            ),
          );
        },
        listener: (context, states) {});
  }
}

bool isBottomSheetOpened = false;
