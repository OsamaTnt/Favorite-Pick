import 'package:favorite_pick/data.dart';
import 'package:favorite_pick/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class GamePlayScreen extends StatelessWidget{
  final String? sportName;
  const GamePlayScreen({Key? key, this.sportName}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        height: 88.h,
        bgColor: const Color(0xff051D47),
        text: sportName,
        iconPath: Provider.of<Data>(context, listen:false).getSportIconPath(sportName),
        bIcon: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff395872), Color(0xff0D3454)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 64.h,
              width: double.infinity,
              color: const Color(0xff2179B8).withOpacity(0.88),
              alignment: Alignment.center,
              child: Text(
                '1/128',  ///TO DO: update this number automatically based on data.
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 21.sp,
                  color: const Color(0xffFFFFFF).withOpacity(0.88),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
