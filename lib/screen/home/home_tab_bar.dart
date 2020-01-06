import 'package:flutter/material.dart';
import 'package:gym/resource/resource.dart';

class HomeTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> names;
  final Function onTap;

  HomeTabBar({
    @required this.tabController,
    @required this.names,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = names
        .map((it) => Tab(
              text: it,
            ))
        .toList();
    return Container(
      color: Resource.color.mainColorDark,
      child: TabBar(
        isScrollable: true,
        labelColor: Resource.color.mainColorLight,
        unselectedLabelColor: Colors.white,
        controller: tabController,
        indicatorColor: Resource.color.mainColorLight,
        tabs: tabs,
        onTap: (index) {
          onTap(index);
        },
      ),
    );
  }
}
