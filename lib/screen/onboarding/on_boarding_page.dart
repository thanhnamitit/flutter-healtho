import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/resource/resource.dart';
import 'package:gym/resource/route.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  Widget _buildItemPageView(OnBoarding onBoarding) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: Resource.space.xxBig * 2,
        ),
        Text(
          onBoarding.title,
          textAlign: TextAlign.center,
          style: Resource.style.onBoardingTitle(),
        ),
        SizedBox(
          height: Resource.space.medium,
        ),
        Text(
          onBoarding.message,
          textAlign: TextAlign.center,
          style: Resource.style.onBoardingMessage(),
        ),
        SizedBox(
          height: Resource.space.xxBig,
        ),
        Image.asset(onBoarding.image),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (_, index) => _buildItemPageView(onBoardings[index]),
      itemCount: onBoardings.length,
      onPageChanged: (pageIndex) {
        setState(() {
          _currentPage = pageIndex;
        });
      },
    );
  }

  Widget _buildSkipButton() {
    return OutlineButton(
      onPressed: _goHome,
      padding: EdgeInsets.symmetric(
        vertical: Resource.space.xSmall,
        horizontal: Resource.space.large,
      ),
      highlightedBorderColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        "skip",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: onBoardings.map((it) {
        return Container(
          margin: EdgeInsets.all(Resource.space.medium),
          width: Resource.space.medium,
          height: Resource.space.medium,
          decoration: BoxDecoration(
            color: it == onBoardings[_currentPage]
                ? Resource.color.mainColorLight
                : Colors.black12,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNextButton() {
    return MaterialButton(
      onPressed: () {
        if (_currentPage == onBoardings.length - 1) {
          _goHome();
        } else {
          _jumpToNextPage();
        }
      },
      padding: EdgeInsets.symmetric(
          horizontal: Resource.space.big, vertical: Resource.space.xxMedium),
      color: Resource.color.mainColorLight,
      child: Text("NEXT"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }

  Widget _buildController() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _buildSkipButton(),
            SizedBox(width: Resource.space.medium),
          ],
        ),
        Column(
          children: <Widget>[
            _buildIndicator(),
            SizedBox(height: Resource.space.big),
            _buildNextButton(),
            SizedBox(height: Resource.space.big),
          ],
        )
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildPageView(),
        _buildController(),
      ],
    );
  }

  void _goHome() {
    Navigator.of(context).pushReplacementNamed(RoutePath.home);
  }

  void _jumpToNextPage() {
    _pageController.animateToPage(
      _currentPage + 1,
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _buildBody(),
      ),
    );
  }
}

final onBoardings = [
  OnBoarding(
      "Exercises", "To Your Personalized Profile", Resource.image.onBoarding1),
  OnBoarding("Keep Eye On Health\nTracking", "Log & reminder your activities",
      Resource.image.onBoarding2),
  OnBoarding(
      "Check Your Progress", "An tracking calendar", Resource.image.onBoarding3)
];

class OnBoarding {
  final String title;
  final String message;
  final String image;

  OnBoarding(this.title, this.message, this.image);
}
