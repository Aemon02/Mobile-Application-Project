// ignore_for_file: prefer_const_constructors

import 'package:airyshare/functions/03_Users_02.dart';
import 'package:airyshare/pages/01_Login_01.dart';
import 'package:airyshare/pages/03_GroupAccount_02.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:airyshare/functions/01_BasicClass_02.dart';
import 'package:airyshare/functions/04_Groups_02.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final TextEditingController groupNameController = TextEditingController();
  final TextEditingController groupImageController = TextEditingController();

  String imageUrl = '';
  File? _imageFile;

  List<String> userNames = [];
  List<String> selectedUserNames = [];
  bool showSelectFriendButton = true;

  void _pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    print('Pick File : ${pickedFile?.path}');

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      return;
    }
    print('File Path: $_imageFile');

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(pickedFile!.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (error) {}
  }

  Future<void> _selectFriend(BuildContext context) async {
    QuerySnapshot<Map<String, dynamic>> usersSnapshot =
        await FirebaseFirestore.instance.collection('Users').get();

    usersSnapshot.docs
        .forEach((DocumentSnapshot<Map<String, dynamic>> userDoc) {
      userNames.add(userDoc.data()!['AccountName']);
    });

    setState(() {
      showSelectFriendButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffCDB4DB),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyTitle.build('Bank\nAccount'),
              Container(
                child: Image.asset(
                  'assets/images/deal.png',
                  height: 170,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTextField.build('ชื่อกลุ่ม', groupNameController),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 59,
                    height: 53,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Center(
                        child: _imageFile != null
                            ? Image.file(
                                _imageFile!,
                                width: 55,
                                height: 49,
                                fit: BoxFit.cover,
                              )
                            : Icon(Icons.photo_library_sharp),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Members",
                  style: TextStyle(
                      color: Color.fromARGB(255, 45, 6, 51),
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                ),
              ),
              Container(
                // padding: EdgeInsets.only(right: 20, top: 8),
                width: 300,
                child: showSelectFriendButton
                    ? ElevatedButton(
                        onPressed: () {
                          _selectFriend(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 169, 98, 184),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Select Friends',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : SizedBox(),
              ),
            ],
          ), //
          Expanded(
            child: ListView.builder(
              itemCount: userNames.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(
                    userNames[index],
                    style: TextStyle(
                        color: Color.fromARGB(255, 45, 6, 51), fontSize: 20),
                  ),
                  secondary: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  activeColor:
                      Colors.purple, // Color of the checkbox when checked
                  checkColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  // controlAffinity: ListTileControlAffinity.leading,
                  value: selectedUserNames.contains(userNames[index]),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20.0),
                  //   side: BorderSide(color: Colors.black),
                  // ),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        selectedUserNames.add(userNames[index]);
                        updateAddGroup(
                          accountname: userNames[index],
                          group: groupNameController.text,
                        );
                      } else {
                        selectedUserNames.remove(userNames[index]);
                        updateDeleteGroup(
                          accountname: userNames[index],
                          group: groupNameController.text,
                        );
                      }
                      print(selectedUserNames);
                    });
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BButton('cancel').build(context),
                ElevatedButton(
                  onPressed: () {
                    if (imageUrl.isEmpty || groupNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("กรุณาใส่ชื่อกลุ่มและเลือกรูปภาพ")));
                      return;
                    }

                    createGroup(
                      groupname: groupNameController.text,
                      imagepath: imageUrl,
                      member: selectedUserNames,
                    );
                    print(imageUrl);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroupAccountPage(
                        groupName: groupNameController.text,
                        groupImagePath: imageUrl,
                        members: selectedUserNames,
                      )),
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
                        "Create Group",
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
