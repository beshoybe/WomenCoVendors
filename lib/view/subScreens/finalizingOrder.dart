import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco_vendors/model/orderClass.dart';
import 'package:womenco_vendors/model/userClass.dart';
import 'package:womenco_vendors/shared/component/components.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';
import 'package:womenco_vendors/viewModel/cubit/states.dart';

class FinishOrder extends StatefulWidget {
  final Order theOrder;
  const FinishOrder({Key? key, required Order this.theOrder}) : super(key: key);

  @override
  State<FinishOrder> createState() => _FinishOrderState();
}

class _FinishOrderState extends State<FinishOrder> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));
    return BlocProvider(
      create: (context) => WomenCoCubitVendors(),
      child: BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
          builder: (context, states) {
            var cubit = WomenCoCubitVendors.GET(context);
            return Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "ORDER ID - ${widget.theOrder.orderID}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Placed on - ${widget.theOrder.day} ${cubit.getMonthFromNum(widget.theOrder.month!.toInt())} ${widget.theOrder.year}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          children: [
                            Icon(Icons.pin_drop),
                            Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Text("${widget.theOrder.address}",
                            style: TextStyle(color: Colors.grey, fontSize: 18)),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Icon(Icons.phone_in_talk),
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Text("${widget.theOrder.userData!.Phone}",
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Icon(Icons.info_outline),
                            Text(
                              "Info",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Text("${widget.theOrder.whatIsOrderType()}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        // Text(
                        //     "${appartmentTypesList[typeController.selectedIndex!.toInt()]} ${sizeController}m , ${appartmentRoomsList[roomsController.selectedIndex!.toInt()]} rooms ",
                        //     style: TextStyle(color: Colors.grey, fontSize: 16)),
                        Text(
                            "Delivery in : ${cubit.getMonthFromNum(widget.theOrder.deliveryDate!.month)}  ${widget.theOrder.deliveryDate!.day}  ${widget.theOrder.deliveryTime!.hour}:${widget.theOrder.deliveryTime!.minute}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30.h),
                        Text(
                          "Worker",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 11.h),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  widget.theOrder.userData!.profileImageURL),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "${widget.theOrder.userData!.Name}",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          "Payment Method",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 11.h),
                        Row(
                          children: [
                            Icon(
                              Icons.money,
                              color: Colors.green,
                            ),
                            SizedBox(width: 10.w),
                            Text("Cash",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 33.h),
                        Text(
                          "Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 11.h,
                        ),
                        Text("Total Fees\t ${widget.theOrder.price} EGP",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.done,
                                        color: Colors.green,
                                        size: 24,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text("Accept",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26))
                                    ],
                                  )),
                            ),
                            Expanded(
                              child: FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.red,
                                        size: 24,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text("Cancel",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26))
                                    ],
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ));
          },
          listener: (context, states) {}),
    );
  }
}
