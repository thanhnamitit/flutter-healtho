import 'package:flutter/material.dart';
import 'package:gym/core/widget/PureInkWell.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/resource/route.dart';

class HealthTipPage extends StatelessWidget {
  Widget _buildHealthTipItem(BuildContext context, HealthTip healthTip) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePath.healthTipDetail, arguments: healthTip);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            FittedBox(
              child: Hero(
                tag: healthTip.image,
                child: Image.asset(healthTip.image),
              ),
              fit: BoxFit.fitWidth,
            ),
            FractionalTranslation(
              translation: Offset(0, 0.25),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xffFCFBFB),
                  border: Border.all(color: Color(0xffD4D4D4)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      healthTip.title,
                      style: Resource.style.homeItemTitle(),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      healthTip.shortContent,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Resource.style.homeItemContent(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (_, index) =>
            _buildHealthTipItem(context, healTips[index]),
        itemCount: healTips.length,
      ),
    );
  }
}

class HealthTip {
  final String title;
  final String shortContent;
  final String image;

  HealthTip({
    @required this.title,
    @required this.shortContent,
    @required this.image,
  });
}

final healTips = <HealthTip>[
  HealthTip(
    title: "A Diet Without Exercise is Useless.",
    shortContent:
        """Interval Training is a form of exercise in which you alternate between two or more different...""",
    image: Resource.image.healtip1,
  ),
  HealthTip(
    title: "Garlic As fresh and Sweet as baby's Breath.",
    shortContent:
        """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    image: Resource.image.healtip2,
  ),
  HealthTip(
    title: "Garlic As fresh and Sweet as baby's Breath.",
    shortContent:
        """Garlic is the plant in the onion family that's grown alternate between  or more exercise...""",
    image: Resource.image.healtip3,
  ),
];
