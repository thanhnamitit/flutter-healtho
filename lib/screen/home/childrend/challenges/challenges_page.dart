import 'package:flutter/material.dart';
import 'package:gym/core/item/SquareItemWithTitle.dart';
import 'package:gym/resource/resource.dart';

class ChallengesPage extends StatefulWidget {
  @override
  _ChallengesPageState createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
      ),
      itemBuilder: (_, index) => SquareItemWithTitle(
        onTap: () {},
        image: challenges[index].image,
        title: challenges[index].name,
        subTitle: challenges[index].time,
      ),
      padding: EdgeInsets.all(16),
      itemCount: challenges.length,
    );
  }
}

class Challenge {
  final String name;
  final String time;
  final String image;

  Challenge({
    @required this.name,
    @required this.time,
    @required this.image,
  });
}

final challenges = [
  Challenge(
    name: "Bench press",
    time: "5 week",
    image: Resource.image.benchPress,
  ),
  Challenge(
    name: "200 Situps",
    time: "10 week",
    image: Resource.image.challenge200SitUp,
  ),
  Challenge(
    name: "100 Pushups",
    time: "8 Week",
    image: Resource.image.challenge100PushUp,
  ),
  Challenge(
    name: "300 Squats",
    time: "5 week",
    image: Resource.image.challenge300Squats,
  ),
  Challenge(
    name: "Run 5 Km",
    time: "5 week",
    image: Resource.image.challengeRun5km,
  ),
  Challenge(
    name: "300 Pushups",
    time: "14 week",
    image: Resource.image.challenge300PushUp,
  ),
];
