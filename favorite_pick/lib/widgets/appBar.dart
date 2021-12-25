import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar({double? height, Color? bgColor, String? text}){
  return AppBar(
    toolbarHeight: height,
    backgroundColor: bgColor,
    centerTitle: true,
    title: Text(
      '$text',
      style: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 21.sp,
        color: const Color(0xffFFFFFF).withOpacity(0.88),
      ),
    ),
  );
}