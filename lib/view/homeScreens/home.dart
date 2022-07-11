import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/model/orderClass.dart';
import 'package:womenco_vendors/model/userClass.dart';
import 'package:womenco_vendors/shared/colors.dart';
import 'package:womenco_vendors/shared/component/components.dart';
import 'package:womenco_vendors/view/subScreens/finalizingOrder.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));

    return BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WomenCoCubitVendors.GET(context);
        return Scaffold(
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      DrawerHeader(
                          child: Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back , ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text("${cubit.currentUser.name}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      )),
                      MaterialButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.person_outline),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Profile"),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )),
                      MaterialButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.language),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Language"),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )),
                      MaterialButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.help),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Help"),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )),
                      MaterialButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Contact Us"),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ))
                    ],
                  ),
                  MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.power_settings_new_rounded,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Sign Out",
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black, size: 30),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 29,
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wallet",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 38.h,
                ),
                Center(
                    child: Column(
                  children: [
                    Text(
                      "Total Balance",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text("EGP  ${cubit.currentUser.totalBalance}",
                        style: TextStyle(
                            color: buttonColor1,
                            fontSize: 32,
                            fontWeight: FontWeight.bold))
                  ],
                )),
                SizedBox(
                  height: 86.h,
                ),
                Text(
                  "Orders",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () {
                    cubit.setCurrentOrder(
                        context,
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
                            month: 9,
                            price: 192));
                  },
                  child: Center(
                    child: Card(
                      child: cubit.allOrders.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("You have no upcoming orders"),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: cubit.allOrders[0].orderWidget(context),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 79.h,
                ),
                Text(
                  "Schedule",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
