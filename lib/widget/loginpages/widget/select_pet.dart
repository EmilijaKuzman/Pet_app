import 'package:flutter/cupertino.dart';

class SelectPet extends StatelessWidget {
  String picture;
  bool? selected;
  VoidCallback? onTap;

  SelectPet({super.key, required this.picture, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        height: 230,
        width: 200,
        decoration: selected == true
            ? BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 218, 125),
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
                color:
                    const Color.fromARGB(255, 255, 220, 132).withOpacity(0.7),
                shape: BoxShape.rectangle,
                border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 102, 183, 187),
                ),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(picture), fit: BoxFit.fill, scale: 1.5),
          ),
        ),
      ),
    );
  }
}
