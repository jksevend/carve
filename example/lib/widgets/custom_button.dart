import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: const Text('CustomButton'),
    );
  }
}