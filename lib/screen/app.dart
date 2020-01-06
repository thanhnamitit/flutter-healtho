import 'package:flutter/material.dart';
import 'package:gym/resource/route.dart';
import 'package:gym/screen/route_config.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePath.splash,
      theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          primarySwatch: Colors.amber,
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white))),
      onGenerateRoute: generateRoute,
    );
  }
}
