// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class MyAppBar {
  static AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffCDB4DB),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class MyTitle {
  static Container build(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 45, 6, 51),
            ),
          ),
        ],
      ),
    );
  }
}

class MyTextField {
  static Padding build(String labelText, controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   labelText,
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.w700,
          //     color: Color.fromARGB(255, 45, 6, 51),
          //   ),
          // ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: labelText,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton {
  final String buttonText;
  final Widget nextPage;

  CustomButton({required this.buttonText, required this.nextPage});

  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff7D4788),
        ),
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}