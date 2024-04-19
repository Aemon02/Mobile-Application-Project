// ignore_for_file: prefer_const_constructors

import 'package:airyshare/functions/01_AppBar_02.dart';
import 'package:airyshare/pages/01_Login_01.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:airyshare/firebase_options.dart';

class CreateAnAccountPage extends StatefulWidget {
  const CreateAnAccountPage({super.key});

  @override
  State<CreateAnAccountPage> createState() => _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends State<CreateAnAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final String _firstName = '';
  final String _lastName = '';
  final String _accountName = '';
  final String _email = '';
  final String _password = '';
  final String _phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDB4DB),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/friendship-day.png'),
            Container(
              child: Center(
                child: Text(
                  "Let's get started",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                      color: Colors.white),
                ),
              ),
            ),
            sidebox(),
            Row(
              children: [
                Expanded(
                  child: InputTextField('ชื่อจริง', firstNameController),
                ),
                SizedBox(width: 10,), // เพิ่มระยะห่างระหว่าง TextFormField
                Expanded(
                  child: InputTextField('นามสกุล', lastNameController),
                ),
              ],
            ),
            sidebox(),
            InputTextField('ชื่อผู้ใช้', accountNameController),
            
            sidebox(),
            InputTextField('อีเมลล์', emailController),
            
            sidebox(),
            InputTextField('รหัสผ่าน', passwordController),
           
            sidebox(),
            InputTextField('เบอร์โทร', phoneController),

            sidebox(),
            Container(
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String firstName = firstNameController.text;
                      String lastName = lastNameController.text;
                      String accountName = accountNameController.text;
                      String email = emailController.text;
                      String password = passwordController.text;
                      String phone = phoneController.text;

                      print('First Name   : $firstName');
                      print('Last Name    : $lastName');
                      print('Account Name : $accountName');
                      print('Email        : $email');
                      print('Password     : $password');
                      print('Phone        : $phone');

                      createUser(
                          firstname: firstName,
                          lastname: lastName,
                          accountname: accountName,
                          email: email,
                          password: password,
                          phone: phone);
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff7D4788)),
                  child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          "Create an Account",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ))),
            ),
            Center(
                child: Text(
                    '.........................................................',
                    style:
                        TextStyle(color: Color(0xff000000), fontSize: 16))),
            sidebox(),
            
            buttonNextPage(context),
        
          ],
        ),
      ),
    );
  }

  Container buttonNextPage(BuildContext context) {
    return Container(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff7D4788)),
                child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        "Log in",
                        style:
                            TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ))),
          );
  }

  TextFormField InputTextField(topic, textController) {
    return TextFormField(
            style: TextStyle(fontFamily: 'Inter'),
            controller: textController, //phoneController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(6),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: topic,//'เบอร์โทร',
              labelStyle: TextStyle(
                  color: Color(0xff999999),
                  fontFamily: 'NotoSansThai',
                  fontSize: 20),
            ),
          );
  }

  SizedBox sidebox() {
    return SizedBox(
            height: 10,
          );
  }
}

void createUser(
    { String? 
      firstname,
      lastname,
      accountname,
      email,
      password,
      phone,
      bank,
      bankaccountname,
      bankaccountnumber,
    }) {
  final docUser = FirebaseFirestore.instance.collection('Users').doc('$accountname');
  final json = {
    'FirstName': firstname,
    'LastName': lastname,
    'AccountName': accountname,
    'Email': email,
    'Password': password,
    'Phone': phone,
    'Bank': bank,
    'BankAccountName': bankaccountname,
    'BankAccountNumber': bankaccountnumber,
  };
  docUser.set(json);
}
