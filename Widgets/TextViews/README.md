# TextViews

used in our project

--

<img width="859" alt="Screen Shot 2023-03-22 at 6 52 22 AM" src="https://user-images.githubusercontent.com/13888326/226926056-0d0273ed-307e-47c6-b387-2e07ccad51c5.png">

--

```

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


```
