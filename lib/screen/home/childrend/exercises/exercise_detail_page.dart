import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/screen/home/childrend/exercises/exercises_group_page.dart';

class ExerciseDetailPage extends StatelessWidget {
  final Exercise _exercise;

  ExerciseDetailPage(this._exercise);

  Widget _buildAppBar() {
    return AppBar(
      title: Text(_exercise.name),
      backgroundColor: Resource.color.mainColorDark,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  Widget _buildImages() {
    return Container(
      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.all(18),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.only(right: 18),
          child: AspectRatio(
            aspectRatio: 283 / 180,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              child: Image.asset(
                images[index],
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        itemCount: images.length,
      ),
    );
  }

  Widget _verticalLargeSpace() {
    return SizedBox(
      height: Resource.space.big,
    );
  }

  Widget _verticalSmallSpace() {
    return SizedBox(
      height: Resource.space.medium,
    );
  }

  Widget _buildArticleContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _verticalSmallSpace(),
          Text(
            _exercise.name,
            style: Resource.style.homeItemTitle(),
          ),
          _verticalSmallSpace(),
          Text(
            content,
            style: Resource.style.homeItemContent(fontSize: 14),
          ),
          _verticalLargeSpace(),
          Text(
            "Equipment Required",
            style: Resource.style.homeItemTitle(),
          ),
          _verticalSmallSpace(),
          Text(
            "Barbell, Bench , Plate, Lock",
            style: Resource.style.homeItemContent(fontSize: 14),
          ),
          _verticalLargeSpace(),
          Text(
            "Target Muscle",
            style: Resource.style.homeItemTitle(),
          ),
          _verticalSmallSpace(),
          Text(
            "Chest, Shoulder, Triceps",
            style: Resource.style.homeItemContent(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_buildImages(), _buildArticleContent()],
      ),
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

final images = [
  Resource.image.benchPress,
  Resource.image.benchPress2,
];

final content = """
1) Lie back on a flat bench. Using a medium width grip, lift the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.

2) From the starting position, breathe in and begin coming down slowly until the bar touches your middle chest.

3) After a brief pause, push the bar back to the starting position as you breathe out.""";
