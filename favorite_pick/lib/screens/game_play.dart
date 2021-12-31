import 'dart:async';
import 'package:favorite_pick/data.dart';
import 'package:favorite_pick/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:favorite_pick/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_widgets/animated_widgets.dart';


class GamePlayScreen extends StatefulWidget{
  const GamePlayScreen({Key? key}): super(key:key);

  @override
  _GamePlayScreen createState() => _GamePlayScreen();
}

class _GamePlayScreen extends State<GamePlayScreen>{

  Future<void> initGame() async{
    Provider.of<Data>(context, listen:false).init();
    List<Club> clubList = await APIManager().fetchClubs(sport: Provider.of<Data>(context, listen:false).activeSport);
    Provider.of<Data>(context, listen:false).initClubs(clubList);
    return;
  }

  @override
  void initState() {super.initState();}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
      Scaffold(
        appBar: appBar(
          title: Provider.of<Data>(context, listen:false).activeSport.toString(),
          bLeadingIcon: true,
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
          child: FutureBuilder(
            future: initGame(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Align(
                  alignment: Alignment.center,
                  child: SpinKitPianoWave(
                    color: const Color(0xff051D47).withOpacity(0.88),
                    size: 100.r,
                  ),
                );
              }
              else if(snapshot.hasError){
                return Center(
                  child: Text(
                    'Failed to start, restart the app or try again',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                      color: const Color(0xffFFFFFF).withOpacity(0.88),
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              else{
                return SingleChildScrollView(
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
                        child: Consumer<Data>(
                          builder: (context, data, widget) =>
                          Text(
                            (data.roundIndex <= data.getMaxRound())? '${data.roundIndex}/${data.getMaxRound()}': '/',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 21.sp,
                              color: const Color(0xffFFFFFF).withOpacity(0.88),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 240.h,
                                  width: double.infinity,
                                  child: Consumer<Data>(
                                    builder: (context, data, widget) =>
                                    ShakeAnimatedWidget(
                                      enabled: data.bShakeLeftClub,
                                      duration: const Duration(milliseconds: 250),
                                      shakeAngle: Rotation.deg(z: 8),
                                      curve: Curves.linear,
                                      child: teamCard(
                                        club: data.selectedClub,
                                        shakeCallback: () async{
                                          data.shakeLeftClub(true);
                                          await Future.delayed(const Duration(milliseconds: 750), (){
                                            data.shakeLeftClub(false);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 240.h,
                                  width: double.infinity,
                                  child: Consumer<Data>(
                                    builder: (context, data, widget) =>
                                    ShakeAnimatedWidget(
                                      enabled: data.bShakeRightClub,
                                      duration: const Duration(milliseconds: 250),
                                      shakeAngle: Rotation.deg(z: 8),
                                      curve: Curves.linear,
                                      child: teamCard(
                                        club: data.clubs[data.roundIndex],
                                        shakeCallback: () async{
                                          data.shakeRightClub(true);
                                          await Future.delayed(const Duration(milliseconds: 750), (){
                                            data.shakeRightClub(false);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 48.h),
                            child: Image(
                              height: 56.h,
                              width: 88.w,
                              image: const AssetImage('images/vs1.png'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            }
          ),
        ),
      ),
    );
  }

  Widget teamCard({required Club club, required Function shakeCallback}){
    return Builder(
      builder: (context) {
        return Consumer<Data>(
          builder: (context, data, widget) =>
          (data.roundIndex <= data.getMaxRound())?
          Material(
            color: const Color(0xff0D5C95).withOpacity(0.58),
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 48.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      height: 56.h,
                      width: 76.w,
                      image: NetworkImage(
                        APIManager().getClubImageURL(sport: data.activeSport, imageID: club.id),
                      ),
                      errorBuilder: (context, object, track) =>
                      Image(
                        height: 56.h,
                        width: 76.w,
                        image: AssetImage(Data.getSportIconPath(sport: data.activeSport)),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      club.name,
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                        color: const Color(0xffFFFFFF).withOpacity(0.88),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    SvgPicture.network(
                      APIManager().getClubCountryImageURL(cc: club.cc),
                      width: 64.w,
                      height: 32.h,
                      placeholderBuilder: (context) =>
                      SpinKitThreeBounce(
                        color: Colors.white.withOpacity(0.88),
                        size: 20.r,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async{
                await shakeCallback();
                Future.delayed(const Duration(milliseconds: 250), (){
                  if(data.roundIndex < data.getMaxRound()) {
                    data.updateSelectedClub(club: club, bNotify:true);
                    data.updateRound();
                  }else{
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      data.updateSelectedClub(club: club);  //notify=false
                      data.updateRound();
                      data.setFavoriteClub();

                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/results');
                    });
                  }
                });
              },
            ),
          ): const SizedBox.shrink(),
        );
      }
    );
  }

}