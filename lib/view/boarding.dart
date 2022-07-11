import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/view/applyNow1.dart';
import 'package:womenco_vendors/view/signIn.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));
    return BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
        builder: (context, states) {
          var cubit = WomenCoCubitVendors.GET(context);
          return Directionality(
            textDirection:
                cubit.checkLang() ? TextDirection.ltr : TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(),
              body: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Image.asset(
                          "assets/boarding.png",
                          height: 642.h,
                        )),
                    Text(
                      cubit.checkLang()
                          ? "Welcome to \nWomenCo Vendors"
                          : "اهلا بك في تطبيق العاملين",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          WomenCoButton(context,
                              title:
                                  cubit.checkLang() ? "Apply Now" : "سجل الان",
                              textColor: Colors.white, onPressed: () {
                            PushRoute(context, ApplyNow1());
                          }, color: Colors.pink[200]),
                          WomenCoButton(context,
                              title:
                                  cubit.checkLang() ? "Signin" : "تسجيل دخول",
                              textColor: Colors.grey, onPressed: () {
                            PushRoute(context, SignIn());
                          }, color: Colors.grey[200])
                        ]))
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, states) {});
  }
}
