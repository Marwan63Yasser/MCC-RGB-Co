import 'package:flutter/material.dart';

const String ksaImage = "assets/images/ksa.jpg";

const Color primaryC1 =  Color(0xff272333);
const Color primaryC2 =  Color(0xff154555);
const Color primaryC3 =  Color(0xffA5702A);
const Color primaryC4 =  Color(0xffD19026);
const Color primaryC5 =  Color(0xffE0B555);

const Color basicC2 =  Color(0xff333333);
const Color basicC3 =  Color(0xff979797);

const Color basicC4 =  Color(0xffAFAFAF);
const Color primaryC7 =  Color(0xffF4F4F4);

defaultText(data,double  size, fontWeight,
    {color = Colors.black,
  double  height = 1.8,
    }) {
  return Text(
    data,
    style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: "Alexandria",
        color: color,
        height: height),
  );
}
