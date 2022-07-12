import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/view/applyNow2.dart';
import 'package:womenco_vendors/view/rquireSteps1.dart';
import 'package:womenco_vendors/viewModel/AuthCubit/cubit.dart';
import 'package:womenco_vendors/viewModel/AuthCubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class ApplyNow1 extends StatelessWidget {
  const ApplyNow1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));
    return BlocConsumer<AuthCubit, AuthStates>(
        builder: (context, states) {
          var cubit = AuthCubit.GET(context);
          return Directionality(
            textDirection: WomenCoCubitVendors.lang
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: Scaffold(
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.pink[200],
                  child: WomenCoCubitVendors.lang
                      ? Icon(Icons.arrow_forward_ios_outlined)
                      : Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      PushRoute(context, ApplyNow_2());
                    }
                  },
                ),
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                WomenCoCubitVendors.lang
                                    ? "Application"
                                    : "حساب جديد",
                                style: TextStyle(
                                    color: Colors.blue[300],
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold),
                              ),
                              Form(
                                key: cubit.formKey,
                                child: Column(
                                  children: [
                                    WomenCoTextField(
                                        controller: cubit.SignupEnglishName,
                                        prefix: Icons.person,
                                        title: WomenCoCubitVendors.lang
                                            ? "English Name"
                                            : "الاسم بالانجليزية"),
                                    WomenCoTextField(
                                        controller: cubit.SignupArabicName,
                                        prefix: Icons.person,
                                        title: WomenCoCubitVendors.lang
                                            ? "Arabic Name"
                                            : "الاسم بالعربية"),
                                    WomenCoTextField(
                                        controller: cubit.SignupEmail,
                                        prefix: Icons.email_outlined,
                                        type: TextInputType.emailAddress,
                                        title: WomenCoCubitVendors.lang
                                            ? "Email (Otional)"
                                            : "البريد الالكتروني (اختياري)"),
                                    WomenCoTextField(
                                        controller: cubit.SignupPhone,
                                        prefix: Icons.call,
                                        type: TextInputType.phone,
                                        title: WomenCoCubitVendors.lang
                                            ? "Phone Number"
                                            : "رقم الهاتف")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
        listener: (context, states) {});
  }
}
