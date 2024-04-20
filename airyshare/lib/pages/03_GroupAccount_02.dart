// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:airyshare/functions/01_BasicClass_02.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupAccountPage extends StatefulWidget {
  final String groupName;
  final String groupImagePath;
  final List<String> members;

  GroupAccountPage(
      {Key? key,
      required this.groupName,
      required this.groupImagePath,
      required this.members})
      : super(key: key);

  @override
  State<GroupAccountPage> createState() => _GroupAccountPageState();
}

class _GroupAccountPageState extends State<GroupAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffCDB4DB),
      appBar: MyAppBar.build(context),
      body: Column(
        
        children: [
          MyTitle.build(widget.groupName),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              // width: 50,
              height: 120, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.members.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/images/profile.jpg'), // รูปภาพสมาชิก
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.members[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title.build('รายการ'),
              Container(
                padding: EdgeInsets.only(right: 30, top: 12),
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff7D4788),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white,), // ไอคอน
                      SizedBox(width: 5), // ระยะห่างระหว่างไอคอนกับข้อความ
                      Text(
                        'เพิ่มรายการ',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
