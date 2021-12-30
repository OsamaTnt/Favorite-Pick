import 'package:favorite_pick/data.dart';
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
        title: 'Winner!',
        bIcon: true,
        bTrailingIcon: true,
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
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 60.h,
                width: double.infinity,
                color: const Color(0xff2179B8).withOpacity(0.88),
                alignment: Alignment.center,
                child: Text(
                  '1/1',  ///TO DO: update this number automatically based on data.
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w700,
                    fontSize: 21.sp,
                    color: const Color(0xffFFFFFF).withOpacity(0.88),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 224.h,
                width: double.infinity,
                child: winningTeamCard(
                  teamName: 'Paris Saint-Germain',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Parallelogram(
                  cutLength: 10.w,
                  edge: Edge.RIGHT,
                  child: Material(
                    color: const Color(0xff6C952B).withOpacity(0.88),
                    child: InkWell(
                      child: SizedBox(
                        width: 290.w,
                        height: 56.h,
                        child: Center(
                          child: Text(
                            'Replay',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
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
                            Navigator.of(context).popAndPushNamed('/start');
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Parallelogram(
                  cutLength: 10.w,
                  edge: Edge.RIGHT,
                  child: Material(
                    color: const Color(0xff6C952B).withOpacity(0.88),
                    child: InkWell(
                      child: SizedBox(
                        width: 290.w,
                        height: 56.h,
                        child: Center(
                          child: Text(
                            'Choose another sport',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
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
                            Navigator.of(context).popAndPushNamed('/');
                            ///Todo reset everything.
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


  Widget winningTeamCard({String? teamName}){
    return Builder(
        builder: (context) {
          return Material(
            color: const Color(0xff0D5C95).withOpacity(0.58),
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<Data>(
                      builder: (context, data, widget) =>
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 100.h,
                            width: 156.w,
                            color: const Color(0xff156CAB).withOpacity(0.88),
                          ),
                          Image(
                            height: 78.h,
                            width: 108.w,
                            image: AssetImage('${data.getTeamIconPath(teamName)}'),
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '$teamName',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 28.sp,
                        color: const Color(0xffFFFFFF).withOpacity(0.88),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              onTap: (){
                Future.delayed(
                  const Duration(milliseconds: 250),
                      (){
                    ///TODO..
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context){
                    //       return const ResultScreen();
                    //     },
                    //   ),
                    // );
                  },
                );
              },
            ),
          );
        }
    );
  }


}


