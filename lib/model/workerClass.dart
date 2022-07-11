import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class Worker extends StatelessWidget {
  final String name;
  final double totalBalance;
  final String profession;
  final String imageURL;
  final int numOfOrders;
  final double rate;
  final int lastOrderDate_Day;
  final int lastOrderDate_Month;
  final int lastOrderDate_Year;
  final bool availability;
  const Worker({
    Key? key,
    required String this.imageURL,
    required String this.name,
    required double this.totalBalance,
    required String this.profession,
    required int this.numOfOrders,
    required double this.rate,
    required bool this.availability,
    required int this.lastOrderDate_Day,
    required int this.lastOrderDate_Month,
    required int this.lastOrderDate_Year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            CircleAvatar(
              radius: 54.5.r,
              backgroundImage: NetworkImage("${this.imageURL}"),
            ),
            SizedBox(height: 13.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${this.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
            Text("${this.profession}",
                style: TextStyle(color: Colors.grey[600])),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 53.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "${this.numOfOrders}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir",
                          fontSize: 18),
                    ),
                    Text("Orders", style: TextStyle(color: Colors.grey))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${this.lastOrderDate_Day}/${this.lastOrderDate_Month}/${this.lastOrderDate_Year}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir",
                          fontSize: 18),
                    ),
                    Text("Last Order", style: TextStyle(color: Colors.grey))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${this.availability ? "Yes" : "No"}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir",
                          fontSize: 18),
                    ),
                    Text("Available", style: TextStyle(color: Colors.grey))
                  ],
                )
              ],
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0),
            child: WomenCoButton(context,
                title: "Hire Now", onPressed: () {}, color: Colors.pink[200]),
          ),
        ],
      ),
    );
  }
}
