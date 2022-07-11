import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womenco_vendors/model/orderClass.dart';
import 'package:womenco_vendors/model/userClass.dart';
import 'package:womenco_vendors/model/workerClass.dart';
import 'package:womenco_vendors/shared/component/components.dart';
import 'package:womenco_vendors/shared/network/local/chache_helper.dart';
import 'package:womenco_vendors/view/subScreens/finalizingOrder.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';

class WomenCoCubitVendors extends Cubit<WomenCoStatesVendors> {
  WomenCoCubitVendors() : super(InitialState());

//-----------------------------Constructor-----------------------------//

  static WomenCoCubitVendors GET(context) => BlocProvider.of(context);

//-----------------------------Variables-----------------------------//
  static bool? lang = CacheHelper.getData(key: "lang");
//---------------------currentUser--------------------------------//
  Worker currentUser = Worker(
      totalBalance: 2150.2,
      imageURL: "",
      name: "name",
      profession: "profession",
      numOfOrders: 20,
      rate: 4.6,
      availability: true,
      lastOrderDate_Day: 20,
      lastOrderDate_Month: 11,
      lastOrderDate_Year: 2022);
//---------------------------------------------------------------//

  var applyEmail = TextEditingController();
  var applyFirstName = TextEditingController();
  var applyLastName = TextEditingController();
  var applyPassword = TextEditingController();

  var nationalID = TextEditingController();

  var phoneNumber = TextEditingController();
  File? profileImage;
  File? criminalChip;

  String? selectedService;
  String? selectedServiceType;
  String emailVerificationCode = "";
  String phoneVerificationCode = "";

  bool isPasswordSecured = true;

  static const String BASE_URL = "https://api.womencoeg.com";

  Order? currentOrder;

  List<Order> allOrders = [
    Order(
        userData: User(
            Name: "Saif",
            Email: "Saifelbob2002@gmail.com",
            Phone: "01157131310",
            profileImageURL: ""),
        deliveryTime: TimeOfDay.now(),
        orderID: "2929382d",
        deliveryDate: DateTime.now(),
        type: orderTypes.Cleaning,
        status: orderStatus.Pending,
        address: "october",
        day: 20,
        year: 2022,
        month: 3,
        price: 122),
  ];
  //----------------- variables of required page ------------------//
  bool isPhoneFinished = false;
  bool isPictureFinished = false;
  bool isIDFinished = false;
  bool isCriminalFinished = false;
  bool isServicesFinished = false;
  //-----------------------------------------------------------------//

  String getMonthFromNum(int monthNum) {
    List months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[monthNum - 1];
  }

  bool checkLang() {
    return lang!;
  }

  void setCurrentOrder(BuildContext context, Order theOrder) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FinishOrder(
                  theOrder: theOrder,
                )));
  }

  Future chooseLanguage(bool isEnglish) async {
    SharedPreferences localData = await local;
    await localData.setBool("lang", isEnglish);
  }

  void addProfileImage(String path) async {
    profileImage = File(path);
    isPictureFinished = true;
    emit(ImageAdded());
  }

  void addNationalID() {
    isIDFinished = true;
    emit(NationalIDAdded());
  }

  void addCriminalChip(String path) async {
    criminalChip = File(path);
    isCriminalFinished = true;
    emit(CriminalChipAdded());
  }

  void addService() {
    isServicesFinished = true;
    emit(ServicesAdded());
  }

  void logIn(BuildContext context, String phone, String password) async {
    await Dio()
        .post("$BASE_URL/vendor/login", data: {
          {"phone": phone, "password": password}
        })
        .then((value) => null)
        .catchError((error) {
          return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: [
                Icon(Icons.error),
                SizedBox(width: 20),
                Text("$error"),
              ],
            ),
            backgroundColor: Colors.red,
          ));
        });
  }
}
