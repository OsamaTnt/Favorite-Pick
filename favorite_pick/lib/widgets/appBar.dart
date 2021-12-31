import 'package:favorite_pick/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';




AppBar appBar({required String title, bool bLeadingIcon=false, bool bTrailingIcon=false}){
  return AppBar(
    toolbarHeight: 86.h,
    backgroundColor: const Color(0xff051D47),
    centerTitle: true,
    title: (bLeadingIcon==false && bTrailingIcon==false)? //home
    Text(
      title,
      style: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
        color: const Color(0xffFFFFFF).withOpacity(0.88),
      ),
    ):
    (bLeadingIcon==true && bTrailingIcon==false)? //start, game_play
    RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Image(
              image: AssetImage(Data.getSportIconPath(sport: title)),
              height: 22.h,
              width: 22.w,
            ),
          ),
          const TextSpan(
            text: '\t\t ',
          ),
          TextSpan(
            text: Data.getSportHeader(sport: title),
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 21.sp,
              color: const Color(0xffFFFFFF).withOpacity(0.88),
            ),
          ),
        ],
      ),
    ):
    Text( //result
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