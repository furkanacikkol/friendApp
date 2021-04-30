import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final VoidCallback onCustomButtonPressed;
  final String text;
  final Icon icon;

  MyButton({@required this.text,@required this.onCustomButtonPressed,@required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: OutlinedButton.icon(
        icon:icon,
        onPressed: onCustomButtonPressed,
        label: Text(text,style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2.0, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),

    );
  }

}