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

class title {
  static Container build(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 45, 6, 51)),
          ),
        ],
      ),
    );
  }
}

class MyTextField {
  static Padding build(String labelText, controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Column(
        children: [
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

class MyTextField1 {
  static Padding build(String labelText, controller) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          SizedBox(
            width: 280,
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

class MyTextField2 {
  static Padding build(String labelText, controller) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          SizedBox(
            width: 80,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
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

class NButton {
  final String buttonText;
  final Widget nextPage;

  NButton(this.buttonText, this.nextPage);

  Widget build(BuildContext context) {
    return ElevatedButton(
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
        width: 120,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class BButton {
  final String buttonText;

  BButton(this.buttonText);

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff7D4788),
      ),
      child: SizedBox(
        height: 50,
        width: 120,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
