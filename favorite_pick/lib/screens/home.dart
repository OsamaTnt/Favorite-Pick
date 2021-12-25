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
    return Scaffold(
      appBar: appBar(
        height: 88.h,
        bgColor: const Color(0xff051D47),
        text: 'Choose sports',
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
                  iconPath: (data.sports[index]=='Football')? 'images/SI_Soccer.png':
                  (data.sports[index]=='Basketball')? 'images/SI_Basketball.png':
                  (data.sports[index]=='Ice Hockey')? 'images/SI_IceHockey.png':
                  (data.sports[index]=='Baseball')? 'images/SI_Baseball.png': '',
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
    );
  }

  Widget sportMenuCard({String? text, String? iconPath}){
    return Material(
      type: MaterialType.card,
      color: const Color(0xff0D5C95),
      child: InkWell(
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical:0, horizontal:32.w),
            leading: Image(
              image: AssetImage('$iconPath'),
              height: 32.h,
              width: 32.w,
            ),
            title: Text(
              '$text',
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                fontSize: 21.sp,
                color: const Color(0xffFFFFFF).withOpacity(0.88),
              ),
            ),
          ),
          
        ),
        onTap: (){
          ///TO DO Navigate to sport n screen.
        },
      ),
    );
  }

}