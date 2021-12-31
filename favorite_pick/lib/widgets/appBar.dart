import 'package:favorite_pick/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';




AppBar appBar({required String title, String? iconPath, bool? bIcon=false, bool? bTrailingIcon=false,}){
  String sportTitle = Data.getSportTranslation(title);

  return AppBar(
    toolbarHeight: 86.h,
    backgroundColor: const Color(0xff051D47),
    centerTitle: true,
    title: (bIcon==false || iconPath?.isEmpty==true || iconPath=='')?
    Text(
      title,
      style: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
        color: const Color(0xffFFFFFF).withOpacity(0.88),
      ),
    ):
    (bTrailingIcon==false)?
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
            text: sportTitle,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 21.sp,
              color: const Color(0xffFFFFFF).withOpacity(0.88),
            ),
          ),
        ],
      ),
    ):
    Text(
      title,
      style: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 21.sp,
        color: const Color(0xffFFFFFF).withOpacity(0.88),
      ),
    ),

    actions: [
      (bTrailingIcon==true)?
      Padding(
        padding: EdgeInsets.only(right: 24.w, bottom: 4.h),
        child: Image(
          height: 32.h,
          width: 32.w,
          image: const AssetImage('images/downloadIcon.png'),
        ),
      ):
      const SizedBox.shrink(),
    ],
  );

}