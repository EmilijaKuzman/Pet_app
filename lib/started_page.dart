import 'package:aplikacija/widget/start_page/start_one_page.dart';
import 'package:aplikacija/widget/start_page/start_two_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartedPage extends StatelessWidget {
  StartedPage({super.key});

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/start1.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 10),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        scale: 2,
                        image: AssetImage("assets/welcome.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 620,
                  child: PageView(
                    controller: controller,
                    children: const [
                      StartOnePage(),
                      StartTwoPage(),
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: const JumpingDotEffect(
                      activeDotColor: Color.fromARGB(255, 255, 220, 132),
                      dotColor: Color.fromARGB(255, 102, 183, 187),
                      dotHeight: 20,
                      dotWidth: 20,
                      spacing: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
