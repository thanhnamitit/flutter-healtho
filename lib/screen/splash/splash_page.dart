import 'package:flutter/material.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/resource/route.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _prepareToNavigate();
    super.initState();
  }

  Future _prepareToNavigate() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed(RoutePath.onBoarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(Resource.image.logo)),
      backgroundColor: Colors.white,
    );
  }
}
