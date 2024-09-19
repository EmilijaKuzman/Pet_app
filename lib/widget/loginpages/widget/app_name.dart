import 'package:flutter/material.dart';

class AppName extends StatefulWidget {
  const AppName({super.key});

  @override
  State<AppName> createState() => _AppNameState();
}

class _AppNameState extends State<AppName> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        // set the default style for the children TextSpans
        //style: Theme.of(context).textTheme.body1.copyWith(fontSize: 30),
        style: TextStyle(
          fontSize: 45,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        children: [
          TextSpan(
            text: 'P',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 220, 132),
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'aw',
          ),
          TextSpan(
            text: 'M',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 220, 132),
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'ate',
          ),
          TextSpan(
            text: 'P',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 220, 132),
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'al',
          ),
        ],
      ),
    );
  }
}
