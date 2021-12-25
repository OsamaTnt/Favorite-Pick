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
        builder: () => const MaterialApp(
          title: 'Favorite Pick',
          home: HomeScreen(),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   // @override
//   // State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text(
    //           'You have pushed the button this many times:',
    //         ),
    //         Text(
    //           '$_counter',
    //           style: Theme.of(context).textTheme.headline4,
    //         ),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
// }
