import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco_vendors/shared/colors.dart';
import 'package:womenco_vendors/shared/component/components.dart';
import 'package:womenco_vendors/view/boarding.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          create: (context) => WomenCoCubitVendors(),
          child: BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                  body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WomenCoButton(context, title: "English Language",
                        onPressed: () {
                      WomenCoCubitVendors.GET(context)
                          .chooseLanguage(true)
                          .then((value) => PushRoute(context, BoardingPage()));
                    }, color: buttonColor1),
                    SizedBox(height: 20),
                    WomenCoButton(context, title: "اللغة العربيه",
                        onPressed: () {
                      WomenCoCubitVendors.GET(context)
                          .chooseLanguage(false)
                          .then((value) => PushRoute(context, BoardingPage()));
                    }, color: buttonColor1)
                  ],
                ),
              ));
            },
          )),
    );
  }
}
