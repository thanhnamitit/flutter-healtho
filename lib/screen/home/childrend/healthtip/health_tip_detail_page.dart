import 'package:flutter/material.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/screen/home/childrend/healthtip/health_tip_page.dart';

class HealthTipDetailPage extends StatelessWidget {
  final HealthTip _healthTip;

  HealthTipDetailPage(this._healthTip);

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Hero(
            tag: _healthTip.image,
            child: FittedBox(child: Image.asset(_healthTip.image)),
          ),
          SizedBox(height: Resource.space.xHuge),
          Text(
            _healthTip.title,
            style: Resource.style.homeItemTitle(),
          ),
          SizedBox(height: Resource.space.medium),
          Text(
            fakeContent,
            style: Resource.style.homeItemContent(),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Health tip"),
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

final fakeContent = """
1) Interval Training is a form of exercise in which you alternate between two or more different exercise . This Consist of doing an exercise at a very high  level intensity for a short bursts.

2) Some high intensity interval training is a great way to burn calories and lose weight.

3) Another great thing is about interval training is that it is extremely time efficient. It does not make any time to get into shape when you practice high intensity interval training.

4) Exercise, especially high intensity interval training, is awesome because it keeps you younger for longer....  

5) Interval Training is a form of exercise in which you alternate between two or more different exercise . This Consist of doing an exercise at a very high  level intensity for a short bursts.

6) Some high intensity interval training is a great way to burn calories and lose weight.

7) Another great thing is about interval training is that it is extremely time efficient. It does not make any time to get into shape when you practice high intensity interval training.

8) Exercise, especially high intensity interval training, is awesome because it keeps you younger for longer….  """;
