// ignore_for_file: prefer_const_constructors

import 'package:airyshare/functions/01_AppBar_02.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final TextEditingController groupNameController = TextEditingController();

  final String _groupName = '';

  File? _imageFile; 

  void _pickImage() async {
    final imagePicker = ImagePicker();
    // final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }

    print('image path : $_imageFile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffCDB4DB),
      // appBar: MyAppBar.build(context),
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
                                : Icon(Icons.photo_library_sharp)),
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
