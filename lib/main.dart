import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:womenco_vendors/shared/network/local/chache_helper.dart';
import 'package:womenco_vendors/shared/network/remote/dio_helper.dart';
import 'package:womenco_vendors/view/boarding.dart';
import 'package:womenco_vendors/view/homeScreens/firstTimeLanguage.dart';
import 'package:womenco_vendors/viewModel/AuthCubit/cubit.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WomenCoCubitVendors()),
          BlocProvider(create: (context) => AuthCubit())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.transparent)),
            home: !WomenCoCubitVendors.lang ? Language() : BoardingPage())));
  });
}
