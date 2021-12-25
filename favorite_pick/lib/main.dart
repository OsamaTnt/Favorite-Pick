import 'package:flutter/material.dart';
import 'package:favorite_pick/screens/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:favorite_pick/data.dart';


void main() {
  Paint.enableDithering = true;
  runApp(const FavoritePick());
}

class FavoritePick extends StatelessWidget {
  const FavoritePick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ Provider(create: (_) => Data()), ],
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => MaterialApp(
          title: 'Favorite Pick',
          routes: {
            '/': (context) =>  const HomeScreen(),
            '/football': (context) =>  const HomeScreen(),
            '/basketball': (context) =>  const HomeScreen(),
            '/iceHockey': (context) =>  const HomeScreen(),
            '/baseball': (context) =>  const HomeScreen(),
          },
          initialRoute: '/',
        ),
      ),
    );
  }
}