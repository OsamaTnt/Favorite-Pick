import 'package:favorite_pick/screens/start.dart';
import 'package:favorite_pick/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:favorite_pick/data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
      Scaffold(
        appBar: appBar(
          title: 'Choose sports',
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
          child: ListView.separated(
            itemCount: Provider.of<Data>(context).sports.length + 1,
            itemBuilder: (context, index){
              return Consumer<Data>(
                builder: (context, data, widget) =>
                (index < data.sports.length)?
                SizedBox(
                  height: 76.h,
                  width: double.infinity,
                  child: sportMenuCard(
                    text: data.sports[index],
                  ),
                ):
                SizedBox(height: 2.h),
              );
            },
            separatorBuilder: (context, index){
              return Container(
                height: 1.h,
                color: const Color(0xff6e9dbf),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget sportMenuCard({required String text}){
    return Builder(
      builder: (context) =>
      Material(
        type: MaterialType.card,
        color: const Color(0xff0D5C95),
        child: InkWell(
          child: Center(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical:0, horizontal:32.w),
              leading: Image(
                image: AssetImage(Data.getSportIconPath(sport: text)),
                height: 32.h,
                width: 32.w,
              ),
              title: Text(
                Data.getSportHeader(sport: text),
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 21.sp,
                  color: const Color(0xffFFFFFF).withOpacity(0.88),
                ),
              ),
            ),
          ),
          onTap: (){
            Provider.of<Data>(context, listen:false).setActiveSport(text);
            Future.delayed(const Duration(milliseconds: 250), () async{
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StartScreen(),
                ),
              );
            });
          },
        ),
      ),
    );
  }

}