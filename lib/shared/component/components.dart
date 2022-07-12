import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:womenco_vendors/viewModel/cubit/bloc.dart';

final Future local = SharedPreferences.getInstance();
void PushRoute(BuildContext context, var route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

Widget WomenCoTextField(
    {required TextEditingController controller,
    bool isPassword = false,
    required IconData prefix,
    Widget? suffix,
    TextInputType type = TextInputType.text,
    required String title}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.0.h),
    child: TextFormField(
      validator: (value) {
        if (prefix != Icons.email_outlined) {
          if (value!.isEmpty || value == " ") {
            return WomenCoCubitVendors.lang!
                ? "Please enter $title"
                : "من فضلك ادخل $title";
          }
        }
      },
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      decoration: InputDecoration(
          prefixIcon: Icon(prefix), suffixIcon: suffix, label: Text(title)),
    ),
  );
}

Widget WomenCoButton(BuildContext context,
    {required String title,
    required Function() onPressed,
    Color? color,
    Color? textColor}) {
  ScreenUtil.init(context, designSize: Size(414, 896));
  return Container(
    width: 364.w,
    height: 46.h,
    child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: textColor, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            enableFeedback: true,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
            backgroundColor: MaterialStateProperty.all(color))),
  );
}

Widget RequiredTiles(String title, bool isFinished, void Function() onPressed,
    {TextEditingController? controller}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: MaterialButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 8,
            child: Row(
              children: [
                Icon(
                  Icons.receipt,
                  size: 34,
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text(title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        )),
                    isFinished
                        ? Text(
                            WomenCoCubitVendors.lang!
                                ? "Next Step"
                                : "الخطوة التاليه",
                            style: TextStyle(
                                color: Colors.blue[400], fontSize: 15),
                          )
                        : Text(
                            WomenCoCubitVendors.lang!
                                ? "Get Started"
                                : "ابدأ الآن",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 15),
                          )
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
        ],
      ),
    ),
  );
}
