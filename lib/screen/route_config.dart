import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/resource/route.dart';
import 'package:gym/screen/home/childrend/exercises/exercise_detail_page.dart';
import 'package:gym/screen/home/childrend/exercises/exercises_group_page.dart';
import 'package:gym/screen/home/childrend/healthtip/health_tip_detail_page.dart';
import 'package:gym/screen/home/childrend/trainer/trainer_detail_page.dart';
import 'package:gym/screen/home/home_page.dart';
import 'package:gym/screen/onboarding/on_boarding_page.dart';
import 'package:gym/screen/splash/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  Widget pageResult;
  switch (settings.name) {
    case RoutePath.splash:
      pageResult = SplashPage();
      break;
    case RoutePath.onBoarding:
      pageResult = OnBoardingPage();
      break;
    case RoutePath.home:
      pageResult = HomePage();
      break;
    case RoutePath.healthTipDetail:
      pageResult = HealthTipDetailPage(args);
      break;
    case RoutePath.exerciseGroup:
      pageResult = ExercisesGroupPage(args);
      break;
    case RoutePath.exerciseDetail:
      pageResult = ExerciseDetailPage(args);
      break;
    case RoutePath.trainerDetail:
      pageResult = TrainerDetailPage(args);
      break;
  }
  print(pageResult);
  return _generateMaterialRoute(pageResult);
}

Route<dynamic> _generateMaterialRoute(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
