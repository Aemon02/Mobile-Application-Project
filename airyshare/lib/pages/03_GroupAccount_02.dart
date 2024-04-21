// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:airyshare/functions/01_BasicClass_02.dart';
import 'package:airyshare/functions/04_Groups_02.dart';
import 'package:airyshare/pages/03_PersonalAccount_01.dart';
import 'package:airyshare/pages/04_AddPaymentList_02.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupAccountPage extends StatefulWidget {
  final String groupName;
  final String groupImagePath;
  final List<String> members;

  final String accountName;
  final String profileImage;

  GroupAccountPage(
      {Key? key,
      required this.groupName,
      required this.groupImagePath,
      required this.members,
      this.accountName = '',
      this.profileImage = ''})
      : super(key: key);

  @override
  State<GroupAccountPage> createState() => _GroupAccountPageState();
}

class _GroupAccountPageState extends State<GroupAccountPage> {
  String? programName;
  String? totalPrice;

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
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPaymentListPage(
                          groupName: widget.groupName,
                        ),
                      ),
                    );

                    if (result != null) {
                      setState(() {
                        programName = result['programName'];
                        totalPrice = result['totalPrice'];
                      });

                      final Map<String, dynamic> itemlist = {
                        'programName': programName,
                        'totalPrice': totalPrice,
                      };

                      addNewPaymentItem(
                          groupName: widget.groupName, newItemData: itemlist);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff7D4788),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'เพิ่มรายการ',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Groups')
                  .doc(widget.groupName)
                  .collection('ItemList')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'));
                }
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return ListView(
                    children: snapshot.data!.docs.map((document) {
                      final itemList = document['ItemList'];
                      final programName = itemList['programName'];
                      final totalPrice = itemList['totalPrice'];
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(programName),
                          subtitle: Text('ราคารวม: $totalPrice'),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/h10.jpg'),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return Center(child: Text('ไม่พบรายการ'));
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalAccountPage(
                    accountName: widget.accountName,
                    profileImage: widget.profileImage,
                  ),
                ),
              );
            },
            child: Text('ok'),
          )
        ],
      ),
    );
  }
}
