import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gym/core/widget/PureInkWell.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/resource/route.dart';
import 'package:gym/screen/home/childrend/exercises/exercises_page.dart';

class ExercisesGroupPage extends StatefulWidget {
  final ExerciseGroup _exerciseGroup;

  ExercisesGroupPage(this._exerciseGroup);

  @override
  _ExercisesGroupPageState createState() => _ExercisesGroupPageState();
}

class _ExercisesGroupPageState extends State<ExercisesGroupPage> {
  Widget _buildExerciseItem(Exercise exercise) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.exerciseDetail, arguments: exercise);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              FittedBox(
                child: Image.asset(exercise.image),
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: Resource.color.mainColorLight,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(32))),
                    child: Text(
                      exercise.name,
                      textAlign: TextAlign.center,
                      style: Resource.style.homeItemTitle(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemBuilder: (_, index) => _buildExerciseItem(exercises[index]),
      itemCount: exercises.length,
      padding: EdgeInsets.all(16),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(widget._exerciseGroup.name),
      backgroundColor: Resource.color.mainColorDark,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

class Exercise {
  final String name;
  final String image;

  Exercise({@required this.name, @required this.image});
}

final exercises = [
  Exercise(name: "Bench press", image: Resource.image.benchPress),
  Exercise(name: "Dumbbell fly", image: Resource.image.dumbbellFly),
  Exercise(name: "Incline press", image: Resource.image.inclinePress),
  Exercise(name: "Decline press", image: Resource.image.declinePress),
];
