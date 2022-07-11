import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';

import '../shared/component/components.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));
    return BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
        builder: (context, states) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
            ),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontSize: 45.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 67.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextField(
                              controller: WomenCoCubitVendors.GET(context)
                                  .applyFirstName,
                              decoration: InputDecoration(
                                labelText: "Phone Number or Email",
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextField(
                              controller: WomenCoCubitVendors.GET(context)
                                  .applyPassword,
                              obscureText: WomenCoCubitVendors.GET(context)
                                  .isPasswordSecured,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: IconButton(
                                    icon: WomenCoCubitVendors.GET(context)
                                            .isPasswordSecured
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        WomenCoCubitVendors.GET(context)
                                                .isPasswordSecured =
                                            !WomenCoCubitVendors.GET(context)
                                                .isPasswordSecured;
                                      });
                                    },
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0.r),
                              child: WomenCoButton(context,
                                  title: "Signin",
                                  onPressed: () {},
                                  color: Colors.pink[200]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, states) {});
  }
}
