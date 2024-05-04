import 'package:flutter/material.dart';

class UIhelper {
  static customTextField(TextEditingController controller, String text,
      IconData iconData, bool toHide, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        style: TextStyle(
            fontSize: width * 0.04,
            color: Colors.black87,
            fontWeight: FontWeight.bold),
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          labelText: text,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        ),
      ),
    );
  }

  static customButton(
      VoidCallback voidCallback, String text, BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.4,
      child: ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: width * 0.05, color: Colors.white),
        ),
      ),
    );
  }

  static customAlertBox(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
        );
      },
    );
  }
}