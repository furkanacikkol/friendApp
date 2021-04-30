import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDigitField extends StatelessWidget {
  final String text;
  final bool obscure;
  final TextEditingController cont;
  final IconData icon;

  MyDigitField(@required this.text, @required this.obscure, @required this.cont,
      @required this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        obscureText: obscure,
        controller: cont,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            prefixIcon: Icon(icon, color: Colors.white),
            labelText: text,
            labelStyle: TextStyle(color: Colors.white)),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
