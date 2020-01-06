import 'package:flutter/material.dart';
import 'package:gym/core/widget/PureInkWell.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/resource/route.dart';

class TrainersPage extends StatefulWidget {
  @override
  _TrainersPageState createState() => _TrainersPageState();
}

class _TrainersPageState extends State<TrainersPage> {
  Widget _buildTrainerItem(Trainer trainer) {
    return PureInkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          RoutePath.trainerDetail,
          arguments: trainer,
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffFCFBFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffD4D4D4), width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              trainer.image,
            ),
            SizedBox(
              width: Resource.space.xMedium,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    trainer.name,
                    style: Resource.style.homeItemTitle(),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    trainer.description,
                    style: Resource.style.homeItemContent(),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: Iterable.generate(
                          trainer.rating,
                          (index) => Icon(
                            Icons.star,
                            size: 16,
                            color: Resource.color.mainColorLight,
                          ),
                        ).toList(),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 16,
                          ),
                          Text(
                            trainer.location,
                            style: Resource.style.homeItemContent(),
                          )
                        ],
                      ),
                    ],
                  )
                ],
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
        padding: EdgeInsets.only(left: 16, right: 16),
        itemBuilder: (_, index) => _buildTrainerItem(trainers[index]),
        itemCount: trainers.length,
      ),
    );
  }
}

class Trainer {
  final String name;
  final String description;
  final String location;
  final int rating;
  final String image;

  Trainer({
    @required this.name,
    @required this.description,
    @required this.location,
    @required this.rating,
    @required this.image,
  });
}

final trainers = [
  Trainer(
    name: "Ashish Chutake",
    description: "Fitness and Physiotheraphy",
    location: "Mumbai",
    rating: 5,
    image: Resource.image.trainerAshishChutake,
  ),
  Trainer(
    name: "Ann Mathewys",
    description: "Weight Loss",
    location: "Nagpur",
    rating: 5,
    image: Resource.image.trainerAnnMathewys,
  ),
  Trainer(
    name: "Lalit Kalambe",
    description: "Fitness and Physiotheraphy",
    location: "Mumbai",
    rating: 4,
    image: Resource.image.trainerLaitKalambe,
  ),
  Trainer(
    name: "Aditya Khobragade",
    description: "Power gaining",
    location: "Bangalore",
    rating: 5,
    image: Resource.image.trainerAdityaKhobragade,
  ),
  Trainer(
    name: "Ashish Chutake",
    description: "Fitness and Physiotheraphy",
    location: "Chennai",
    rating: 5,
    image: Resource.image.trainerAshishChutake2,
  ),
  Trainer(
    name: "Darshan Barapatre",
    description: "Mass gain",
    location: "Delhi",
    rating: 5,
    image: Resource.image.trainerDarshanBarapatre,
  ),
];
