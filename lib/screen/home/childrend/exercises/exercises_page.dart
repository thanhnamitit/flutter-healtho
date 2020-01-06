import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/core/item/SquareItemWithTitle.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/resource/route.dart';

class ExercisesPage extends StatefulWidget {
  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  Widget _buildExerciseItem(ExerciseGroup exercise) {
    return SquareItemWithTitle(
      title: exercise.name,
      subTitle: "${exercise.numOfArticle} Exercises",
      image: exercise.image,
      onTap: () {
        Navigator.of(context).pushNamed(
          RoutePath.exerciseGroup,
          arguments: exercise,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
      ),
      itemBuilder: (_, index) => _buildExerciseItem(exercises[index]),
      padding: EdgeInsets.all(16),
      itemCount: exercises.length,
    );
  }
}

class ExerciseGroup {
  final String name;
  final int numOfArticle;
  final String image;

  ExerciseGroup({
    @required this.name,
    @required this.numOfArticle,
    @required this.image,
  });
}

final exercises = [
  ExerciseGroup(
    name: "Chest",
    numOfArticle: 16,
    image: Resource.image.chestExercises,
  ),
  ExerciseGroup(
    name: "Back",
    numOfArticle: 16,
    image: Resource.image.backExercises,
  ),
  ExerciseGroup(
    name: "Biceps",
    numOfArticle: 16,
    image: Resource.image.bicepsExercises,
  ),
  ExerciseGroup(
    name: "Triceps",
    numOfArticle: 16,
    image: Resource.image.tricepsExercises,
  ),
  ExerciseGroup(
    name: "Shoulders",
    numOfArticle: 16,
    image: Resource.image.shoulderExercises,
  ),
  ExerciseGroup(
    name: "Abs",
    numOfArticle: 16,
    image: Resource.image.absExercises,
  ),
  ExerciseGroup(
    name: "Leg",
    numOfArticle: 16,
    image: Resource.image.legExercises,
  ),
  ExerciseGroup(
    name: "Neck",
    numOfArticle: 16,
    image: Resource.image.neckExercises,
  ),
];
