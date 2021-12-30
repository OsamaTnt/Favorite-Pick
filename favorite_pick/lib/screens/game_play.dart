import 'package:favorite_pick/data.dart';
import 'package:favorite_pick/screens/results.dart';
import 'package:favorite_pick/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:favorite_pick/api.dart';


class GamePlayScreen extends StatefulWidget{
  const GamePlayScreen({Key? key}): super(key:key);

  @override
  _GamePlayScreen createState() => _GamePlayScreen();
}


class _GamePlayScreen extends State<GamePlayScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        height: 88.h,
        bgColor: const Color(0xff051D47),
        title: Provider.of<Data>(context, listen:false).selectedSport.toString(),
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
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 240.h,
                          width: double.infinity,
                          child: teamCard(
                            teamName: 'Manchester United',
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
                          child: teamCard(
                            teamName: 'Paris Saint-Germain',
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
        ),
      ),
    );
  }


  Widget teamCard({String? teamName}){
    return Builder(
      builder: (context) {
        return Material(
          color: const Color(0xff0D5C95).withOpacity(0.58),
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.only(top: 48.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<Data>(
                    builder: (context, data, widget) =>
                    Image(
                      height: 56.h,
                      width: 76.w,
                      image: AssetImage('${data.getTeamIconPath(teamName)}'),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    '$teamName',
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
                  Consumer<Data>(
                    builder: (context, data, widget) =>
                    Image(
                      width: 46.w,
                      height: 28.h,
                      image: AssetImage(
                        '${data.getCountryIconPath(teamName)}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              Future.delayed(
                const Duration(milliseconds: 250),
                (){
                  ///TODO..
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return const ResultScreen();
                      },
                    ),
                  );
                },
              );
            },
          ),
        );
      }
    );
  }

}
