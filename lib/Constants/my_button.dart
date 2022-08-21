import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String title;
  final Color buttonColor;
  final VoidCallback onPress;
  final Color titleColor;
  const MyButton({Key? key, required this.title, this.buttonColor = const Color(0xff292C34),required this.onPress, this.titleColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonColor
            ),
            child: Center(
              child: Text(title,style:  TextStyle(
                fontSize: 20,
                color: titleColor
              ),)
            ),
          ),
        ),
      ),
    );
  }
}



