import 'package:flutter/material.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/screen/home/childrend/challenges/challenges_page.dart';
import 'package:gym/screen/home/childrend/healthtip/health_tip_page.dart';
import 'package:gym/screen/home/childrend/trainer/trainers_page.dart';
import 'package:gym/screen/home/childrend/workoutplan/workout_plan_page.dart';
import 'package:gym/screen/home/home_tab_bar.dart';

import 'childrend/exercises/exercises_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    _tabController =
        TabController(length: pages.length, initialIndex: 0, vsync: this);
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (_, index) {
          return pages.values.toList()[index]();
        },
        itemCount: pages.length,
        onPageChanged: _onPageChanged,
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        HomeTabBar(
          tabController: _tabController,
          names: pages.keys.toList(),
          onTap: _onTabSelected,
        ),
        _buildPageView(),
      ],
    );
  }

  void _onTabSelected(int index) {
    if (_pageController.page.toInt() != index) {
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
    }
  }

  void _onPageChanged(int index) {
    _tabController.animateTo(index);
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Resource.color.mainColorDark,
      title: Text("Healtho"),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), title: Text("")),
        BottomNavigationBarItem(icon: Icon(Icons.access_time), title: Text("")),
        BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("")),
        BottomNavigationBarItem(icon: Icon(Icons.info), title: Text("")),
      ],
      selectedItemColor: Resource.color.mainColorLight,
      unselectedItemColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }
}

final pages = {
  "Health tip": () => HealthTipPage(),
  "Exercises": () => ExercisesPage(),
  "Workout Plan": () => WorkoutPlanPage(),
  "Challenges": () => ChallengesPage(),
  "Trainers": () => TrainersPage(),
};
