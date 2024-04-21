// ignore_for_file: prefer_const_constructors

import 'package:airyshare/functions/01_BasicClass_02.dart';
import 'package:airyshare/pages/03_GroupAccount_02.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPaymentListPage extends StatefulWidget {
  final String groupName;

  const AddPaymentListPage({super.key, required this.groupName});

  @override
  State<AddPaymentListPage> createState() => _AddPaymentListPageState();
}

class _AddPaymentListPageState extends State<AddPaymentListPage> {
  final TextEditingController programNameController = TextEditingController();
  final TextEditingController subItemsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalPriceController = TextEditingController();

  List<Widget> rows = [];

  List<TextEditingController> priceControllers = [];
  List<TextEditingController> subItemsControllers = [];

  List<String> selectedMembers = [];
  List<String> selectedMembersBank = [];

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var controller in priceControllers) {
      if (controller.text.isNotEmpty) {
        totalPrice += double.parse(controller.text);
      }
    }
    print('Total Price : $totalPrice');
    return totalPrice;
  }

  String GroupName = '';
  String imagePath = '';
  List<String> members = [];

  void groupData() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('Groups')
            .doc(widget.groupName)
            .get();
    if (documentSnapshot.exists) {
      // ตรวจสอบว่ามีข้อมูลในเอกสารนี้หรือไม่

      // สามารถเข้าถึงข้อมูลได้โดยใช้ data['ชื่อฟิลด์']
      GroupName = documentSnapshot.data()!['GroupName'];
      imagePath = documentSnapshot.data()!['ImagePath'];
      members = List<String>.from(documentSnapshot.data()!['Member']);
      print(members);
    } else {
      print('ไม่พบเอกสาร');
    }
  }

  @override
  void initState() {
    super.initState();
    groupData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffCDB4DB),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          MyTitle.build('Add \nPayment'),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 12),
            child: TextField(
              controller: programNameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'ชื่อรายการ',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rows.length,
              itemBuilder: (context, index) {
                return rows[index];
              },
            ),
          ),
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                onPressed: () {
                  setState(() {
                    TextEditingController newPriceController =
                        TextEditingController();
                    priceControllers.add(newPriceController);

                    TextEditingController newSubItemsController =
                        TextEditingController();
                    subItemsControllers.add(newSubItemsController);

                    rows.add(
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyTextField1.build(
                                'รายการย่อย', newSubItemsController),
                            MyTextField2.build('ราคา', newPriceController),
                          ],
                        ),
                      ),
                    );
                  });
                },
                icon: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color.fromARGB(255, 152, 99, 168),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: EdgeInsets.only(left: 20),
                onPressed: () {
                  double totalPrice = calculateTotalPrice();
                  totalPriceController.text = totalPrice.toString();
                },
                icon: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color.fromARGB(255, 152, 99, 168),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                width: 320,
                child: TextField(
                  controller: totalPriceController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'ราคารวมทั้งหมด',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ],
          ),
          title.build('Select payment Account'),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: members.length,
                itemBuilder: (BuildContext context, int index) {
                  final isSelected =
                      selectedMembersBank.contains(members[index]);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedMembersBank.remove(members[index]);
                        } else {
                          selectedMembersBank.add(members[index]);
                        }
                        print('Members Bank : $selectedMembersBank');
                      });
                    },
                    child: Card(
                      color: isSelected
                          ? Color.fromARGB(255, 201, 116, 157)
                          : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/profile.jpg',
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              members[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          title.build('Select payers'),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: members.length,
                itemBuilder: (BuildContext context, int index) {
                  final isSelected = selectedMembers.contains(members[index]);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedMembers.remove(members[index]);
                        } else {
                          selectedMembers.add(members[index]);
                        }
                        print('Members : $selectedMembers');
                      });
                    },
                    child: Card(
                      color: isSelected
                          ? Color.fromARGB(255, 116, 147, 201)
                          : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/profile.jpg',
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              members[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BButton('cancel').build(context),
                ElevatedButton(
                  // onPressed: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => GroupAccountPage(
                  //               groupName: GroupName,
                  //               groupImagePath: imagePath,
                  //               members: members,
                  //             )),
                  //   );
                  // },

                  onPressed: () {
                    // สร้าง Map เพื่อเก็บข้อมูลรายการและจำนวนเงินรวม
                    Map<String, dynamic> data = {
                      'programName': programNameController.text,
                      'totalPrice': totalPriceController.text,
                    };

                    // ส่งข้อมูลกลับไปยังหน้า GroupAccountPage และระบุค่าที่ต้องการส่งคืนไป
                    Navigator.pop(context, data);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff7D4788),
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 120,
                    child: Center(
                      child: Text(
                        "finish",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
