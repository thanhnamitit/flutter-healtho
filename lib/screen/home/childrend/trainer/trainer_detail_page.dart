import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/screen/home/childrend/trainer/trainers_page.dart';

class TrainerDetailPage extends StatefulWidget {
  final Trainer _trainer;

  TrainerDetailPage(this._trainer);

  @override
  _TrainerDetailPageState createState() => _TrainerDetailPageState();
}

class _TrainerDetailPageState extends State<TrainerDetailPage> {
  Widget _verticalSpace() {
    return SizedBox(
      height: 16,
    );
  }

  Widget _buildAccountInfoItem(String content, String title) {
    return Column(
      children: <Widget>[
        Text(
          content,
          style: Resource.style.homeItemTitle(),
        ),
        SizedBox(height: 6),
        Text(
          title,
          style: Resource.style.homeItemContent(),
        ),
      ],
    );
  }

  Widget _buildInfoItem(InfoPair info) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xffFCFBFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffD4D4D4)),
      ),
      child: Column(
        children: <Widget>[
          Text(
            info.title,
            style: Resource.style.homeItemTitle(),
          ),
          SizedBox(height: 6),
          Text(
            info.detail,
            style: Resource.style.homeItemContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String name) {
    return MaterialButton(
      onPressed: () {},
      child: Text(name),
      color: Resource.color.mainColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              _verticalSpace(),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(Resource.image.trainerAshishChutake3),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 4),
                              Text(
                                widget._trainer.name,
                                style:
                                    Resource.style.homeItemTitle(fontSize: 18),
                              ),
                              SizedBox(height: 4),
                              Text(
                                widget._trainer.description,
                                style: Resource.style
                                    .homeItemContent(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(child: _buildButton("Follow")),
                              SizedBox(width: 12),
                              Expanded(child: _buildButton("Contact")),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 16,
                  ),
                  Text(
                    widget._trainer.location,
                    style: Resource.style.homeItemContent(),
                  )
                ],
              ),
              _verticalSpace(),
              IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildAccountInfoItem("4/5", "Ratings"),
                      Container(
                        width: 1,
                        color: Color(0xff2C2C2C),
                      ),
                      _buildAccountInfoItem("78", "Following"),
                      Container(
                        width: 1,
                        color: Color(0xff2C2C2C),
                      ),
                      _buildAccountInfoItem("5634", "Followers"),
                    ],
                  ),
                ),
              ),
              _verticalSpace(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset(Resource.image.icFacebook),
                    Image.asset(Resource.image.icTwitter),
                    Image.asset(Resource.image.icInstagram),
                    Image.asset(Resource.image.icYoutube),
                  ],
                ),
              ),
              _verticalSpace(),
              Container(
                height: 1,
                color: Color(0xffE5E5E5),
              ),
              _verticalSpace(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => _buildInfoItem(infoPairs[index]),
                itemCount: infoPairs.length,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }
}

class InfoPair {
  final String title;
  final String detail;

  InfoPair({@required this.title, @required this.detail});
}

final infoPairs = [
  InfoPair(
    title: "Certifications",
    detail: "Advance Trainer Certification ISSA",
  ),
  InfoPair(
    title: "Awards",
    detail: "Best in Muscle Building",
  ),
  InfoPair(
    title: "Publish Articles",
    detail: "Why Breathing is necessary while Gyming",
  ),
  InfoPair(
    title: "Conferences and Expos Attended",
    detail: "Advance Trainer Certification ISSA",
  ),
  InfoPair(
    title: "Personal Training Client and Feedback",
    detail: "Strict, Calm in Nature",
  ),
];
