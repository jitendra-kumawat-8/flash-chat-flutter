import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {

  final String textForButton;
  final Function onPressed;
  final Color whatColor;

  RoundedButtonWidget({this.textForButton, this.onPressed, this.whatColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: whatColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            textForButton,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
