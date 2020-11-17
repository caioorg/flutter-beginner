
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;

  Button(this.text, this.onPressed, { this.color = Colors.blue });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: onPressed,
    );
  }
}
