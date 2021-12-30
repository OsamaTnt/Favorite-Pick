import 'package:favorite_pick/api.dart' as api_manager;
import 'package:favorite_pick/data.dart';
import 'package:favorite_pick/screens/game_play.dart';
import 'package:favorite_pick/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget{
  const StartScreen({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        height: 88.h,
        bgColor: const Color(0xff051D47),
        text: Provider.of<Data>(context, listen:false).selectedSport,
        iconPath: Provider.of<Data>(context, listen:false).getSportIconPath(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 22.h),
              child: Text(
                'Choose your favorite team',
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
                          'Start Selection',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            color: const Color(0xffFFFFFF).withOpacity(0.88),
                          ),
                        ),
                      ),
                    ),
                    onTap: () async{
                      Future.delayed(
                        const Duration(milliseconds: 0),
                        () async{
                          List<Club>? x = await api_manager.APIManager().fetchClubs(sport: 'soccer');
                          print(x[5].name);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const GamePlayScreen(),
                          //   ),
                          // );
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
    );
  }

}


