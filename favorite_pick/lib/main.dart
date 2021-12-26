import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:favorite_pick/data.dart';

import 'package:favorite_pick/screens/home.dart';
import 'package:favorite_pick/screens/start.dart';
import 'package:favorite_pick/screens/game_play.dart';
import 'package:favorite_pick/screens/results.dart';


void main() {
  Paint.enableDithering = true;
  runApp(const FavoritePick());
}

class FavoritePick extends StatelessWidget {
  const FavoritePick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ ChangeNotifierProvider(create: (_) => Data()), ],
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => MaterialApp(
          title: 'Favorite Pick',
          routes: {
            '/': (context) =>  const HomeScreen(),
            '/start': (context) =>  const StartScreen(),
            '/gamePlay': (context) => const GamePlayScreen(),
            '/results': (context) => const ResultScreen(),
          },
          initialRoute: '/start',
        ),
      ),
    );
  }
}
