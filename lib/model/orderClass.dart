import 'package:flutter/material.dart';
import 'package:womenco_vendors/model/userClass.dart';
import 'package:womenco_vendors/shared/colors.dart';
import 'package:womenco_vendors/view/homeScreens/home.dart';
import 'package:womenco_vendors/view/subScreens/allOrders.dart';
import 'package:womenco_vendors/view/subScreens/finalizingOrder.dart';

class Order {
  String? orderID;
  orderTypes? type;
  orderStatus? status;
  String? address;
  double? price;
  int? day;
  int? month;
  int? year;
  DateTime? deliveryDate;
  TimeOfDay? deliveryTime;
  User? userData;

  Order(
      {required String orderID,
      required User userData,
      required orderTypes type,
      required orderStatus status,
      required String address,
      required int day,
      required int year,
      required int month,
      required TimeOfDay? deliveryTime,
      required DateTime deliveryDate,
      required double price}) {
    this.userData = userData;
    this.deliveryTime = deliveryTime;
    this.orderID = orderID;
    this.type = type;
    this.status = status;
    this.address = address;
    this.price = price;
    this.deliveryDate = deliveryDate;
    this.year = year;
    this.day = day;
    this.month = month;
  }

  Text whatIsStatus() {
    switch (this.status) {
      case orderStatus.Completed:
        return Text("Completed",
            style: TextStyle(
                fontSize: 14, fontFamily: "Avenir", color: Colors.green));
      case orderStatus.Pending:
        return Text("Pending",
            style: TextStyle(
                fontSize: 14, fontFamily: "Avenir", color: Colors.pink));
      default:
        return Text("unexpected error");
    }
  }

  String whatIsOrderType() {
    switch (this.type) {
      case orderTypes.Cleaning:
        return "Cleaning";
      case orderTypes.Cooking:
        return "Cooking";
      case orderTypes.Nursing:
        return "Nursing";
      default:
        return "unexpected error";
    }
  }

  Widget orderWidget(context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${this.year}/${this.month}/${this.day}",
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                Text(
                  whatIsOrderType(),
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                whatIsStatus(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 2,
                height: 70,
                color: buttonColor1,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${this.address}",
                  style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                ),
                Text("${this.price!.toInt()} EGP",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
        TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllPastOrder()));
            },
            child: Row(
              children: [
                Text(
                  "See Past Orders   ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios, size: 20)
              ],
            ))
      ],
    );
  }
}

enum orderTypes { Cleaning, Nursing, Cooking }
enum orderStatus { Completed, Pending }
