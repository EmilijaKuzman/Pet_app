import 'package:flutter/material.dart';

class StartOnePage extends StatelessWidget {
  const StartOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage("assets/catdog.png"), fit: BoxFit.cover),
          ),
        ),
        const Center(
          child: Text(
            "Your pet does't have \n an emotional partner.\nYou're in the right place.",
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
