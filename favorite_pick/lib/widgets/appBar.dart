import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


AppBar appBar({double? height, Color? bgColor, String? text, String? iconPath, bool bIcon=false}){
  return AppBar(
    toolbarHeight: height,
    backgroundColor: bgColor,
    centerTitle: true,
    title: (iconPath?.isEmpty==true || iconPath=='' || bIcon==false)?
    Text(
      '$text',
      style: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
        color: const Color(0xffFFFFFF).withOpacity(0.88),
      ),
    ):
    RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Image(
              image: AssetImage('$iconPath'),
              height: 22.h,
              width: 22.w,
            ),
          ),
          const TextSpan(
            text: '\t\t ',
          ),
          TextSpan(
            text: text,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 21.sp,
              color: const Color(0xffFFFFFF).withOpacity(0.88),
            ),
          ),
        ],
      ),
    ),
  );

}