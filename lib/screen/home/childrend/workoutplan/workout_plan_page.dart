import 'package:flutter/material.dart';
import 'package:gym/resource/resource.dart';

class WorkoutPlanPage extends StatefulWidget {
  @override
  _WorkoutPlanPageState createState() => _WorkoutPlanPageState();
}

class _WorkoutPlanPageState extends State<WorkoutPlanPage> {
  Widget _verticalSpace() {
    return SizedBox(
      height: Resource.space.large,
    );
  }

  Widget _buildButtonGroup(String title, String message, IconData icon) {
    return Container(
      margin: EdgeInsets.only(right: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Color(0xffF0F0F3),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: <Widget>[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border:
                  Border.all(color: Resource.color.mainColorLight, width: 2),
            ),
            child: Icon(
              icon,
              color: Resource.color.mainColorLight,
            ),
          ),
          SizedBox(width: Resource.space.xxLarge),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Resource.style.homeItemTitle(),
                ),
                SizedBox(height: Resource.space.medium),
                Text(
                  message,
                  style: Resource.style.homeItemContent(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMyPlanButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(vertical: 12),
        color: Resource.color.mainColorLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Text(
          "My plan",
          style: Resource.style.homeItemTitle(),
        ),
      ),
    );
  }

  Widget _buildWorkoutPlanGroup(String title, List<String> images) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: Resource.style.homeItemTitle(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Text(
                "More",
                style: TextStyle(color: Resource.color.mainColorLight),
              ),
            )
          ],
        ),
        _verticalSpace(),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.only(right: 24),
              child: AspectRatio(
                aspectRatio: 244 / 138,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            itemCount: images.length,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 18, top: 18, bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildButtonGroup(
              "Find a Workout Plan",
              "Perfect Workout plan that fulfill your fitness goal",
              Icons.search,
            ),
            _verticalSpace(),
            _buildMyPlanButton(),
            _verticalSpace(),
            _buildButtonGroup(
              "Creat New Plan",
              "Customise workout plans as per your need",
              Icons.add,
            ),
            _verticalSpace(),
            _buildWorkoutPlanGroup("Muscle Building", [
              Resource.image.muscleBuilding1,
              Resource.image.muscleBuilding2,
            ]),
            _verticalSpace(),
            _buildWorkoutPlanGroup("Gain Strength", [
              Resource.image.gainStrength1,
              Resource.image.chestExercises,
            ]),
          ],
        ),
      ),
    );
  }
}
