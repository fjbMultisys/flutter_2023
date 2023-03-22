import 'package:flutter/material.dart';

class BorderedTextField extends StatefulWidget {
  final String labelText;
  
  const BorderedTextField({super.key, required this.labelText});

  @override
  _BorderedTextFieldState createState() => _BorderedTextFieldState();
}

class _BorderedTextFieldState extends State<BorderedTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 212, 212, 212)),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        decoration:
        InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.green[400]),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
