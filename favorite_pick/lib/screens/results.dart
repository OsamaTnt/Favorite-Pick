import 'package:favorite_pick/data.dart';
import 'package:favorite_pick/screens/game_play.dart';
import 'package:favorite_pick/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        height: 88.h,
        bgColor: const Color(0xff051D47),
        text: 'Winner!',
        bIcon: false,
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
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
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
              Padding(
                padding: EdgeInsets.only(bottom: 22.h),
                child: Text(
                  'Paris Saint-Germain',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    color: const Color(0xffFFFFFF).withOpacity(0.88),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Parallelogram(
                  cutLength: 10.w,
                  edge: Edge.RIGHT,
                  child: Material(
                    color: const Color(0xff6C952B).withOpacity(0.88),
                    child: InkWell(
                      child: SizedBox(
                        width: 300.w,
                        height: 68.h,
                        child: Center(
                          child: Text(
                            'Replay',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: const Color(0xffFFFFFF).withOpacity(0.88),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        Future.delayed(
                          const Duration(milliseconds: 250),
                          (){
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Parallelogram(
                  cutLength: 10.w,
                  edge: Edge.RIGHT,
                  child: Material(
                    color: const Color(0xff6C952B).withOpacity(0.88),
                    child: InkWell(
                      child: SizedBox(
                        width: 300.w,
                        height: 68.h,
                        child: Center(
                          child: Text(
                            'Choose another sport',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: const Color(0xffFFFFFF).withOpacity(0.88),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        Future.delayed(
                          const Duration(milliseconds: 250),
                              (){
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


