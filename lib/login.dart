import 'package:aplikacija/bloc/pet_bloc.dart';
import 'package:aplikacija/pet_home.dart';
import 'package:aplikacija/widget/loginpages/birthday_page.dart';
import 'package:aplikacija/widget/loginpages/breed_page.dart';
import 'package:aplikacija/widget/loginpages/city_page.dart';
import 'package:aplikacija/widget/loginpages/gender_page.dart';
import 'package:aplikacija/widget/loginpages/name_page.dart';
import 'package:aplikacija/widget/loginpages/picture.dart';
import 'package:aplikacija/widget/loginpages/type_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PageController controllerPage = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  void initState() {
    controllerPage.addListener(() {
      if (controllerPage.page?.round() != currentIndex) {
        setState(() {
          currentIndex = controllerPage.page!.round();
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: BlocListener<PetBloc, PetState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error ?? "error"),
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/login.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage("assets/welcome.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 550,
                    child: PageView(
                      controller: controllerPage,
                      children: const [
                        NamePage(),
                        GenderPage(),
                        BirthdayPage(),
                        TypePage(),
                        BreedPage(),
                        CityPage(),
                        PicturePage(),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      currentIndex == 6
                          ? {
                              context.read<PetBloc>().add(AddNewPetEvent()),
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PetHome()),
                                  (Route<dynamic> route) {
                                return false;
                              }),
                            }
                          : controllerPage.animateToPage(currentIndex + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                    },
                    child: Container(
                      height: 80,
                      width: 300,
                      margin: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Color.fromARGB(255, 197, 140, 113),
                      ),
                      child: Center(
                        child: Text(
                          currentIndex == 6 ? "Finish!" : "Next",
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controllerPage,
                    count: 7,
                    effect: const JumpingDotEffect(
                        activeDotColor: Color.fromARGB(255, 255, 220, 132),
                        dotColor: Color.fromARGB(255, 102, 183, 187),
                        dotHeight: 18,
                        dotWidth: 18,
                        spacing: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
