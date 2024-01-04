import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tryout/res/constants/colors.dart';
import 'package:tryout/res/styles/textstyle.dart';

// ignore: must_be_immutable
class Mybutton extends StatelessWidget {
   Mybutton({super.key,required this.text,required this.ontap,this.icon});
String text;
VoidCallback ontap;
IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
      height: 50.px,width: 200.px,
      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(20),color: Colorsclass.buttoncolor),
      child: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(icon),
          Text(text,style: Textstyleclass.textstyle(),),
        ],
      )),
    ),);
  }
}