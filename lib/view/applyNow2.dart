import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/view/rquireSteps1.dart';
import 'package:womenco_vendors/viewModel/AuthCubit/cubit.dart';
import 'package:womenco_vendors/viewModel/AuthCubit/states.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class ApplyNow_2 extends StatelessWidget {
  const ApplyNow_2({Key? key}) : super(key: key);

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
                      PushRoute(context, RequiredSteps());
                    }
                  },
                ),
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              WomenCoCubitVendors.lang
                                  ? "Password"
                                  : "كلمة السر",
                              style: TextStyle(
                                  color: Colors.blue[300],
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                            ),
                            Form(
                              key: cubit.formKey2,
                              child: Column(
                                children: [
                                  WomenCoTextField(
                                      controller: cubit.SignupPassword,
                                      prefix: Icons.security_outlined,
                                      isPassword: cubit.isPass,
                                      suffix: IconButton(
                                          onPressed: () {
                                            cubit.ChangePassShow();
                                          },
                                          icon: Icon(cubit.isPass
                                              ? Icons.visibility_off
                                              : Icons.visibility)),
                                      title: WomenCoCubitVendors.lang
                                          ? "Password"
                                          : "كلمة السر"),
                                  WomenCoTextField(
                                      controller: cubit.SignupConfirmPassword,
                                      prefix: Icons.security_outlined,
                                      isPassword: cubit.isPassConfirm,
                                      suffix: IconButton(
                                          onPressed: () {
                                            cubit.ChangePassConfirmShow();
                                          },
                                          icon: Icon(cubit.isPassConfirm
                                              ? Icons.visibility_off
                                              : Icons.visibility)),
                                      title: WomenCoCubitVendors.lang
                                          ? "Confirm Password"
                                          : "تأكيد كلمة السر"),
                                ],
                              ),
                            ),
                          ],
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
