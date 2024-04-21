// ignore_for_file: prefer_const_constructors
import 'package:airyshare/functions/02_Photo_02.dart';
import 'package:airyshare/pages/01_AddBank_02.dart';
import 'package:airyshare/pages/02_CreateAccount_01.dart';
import 'package:airyshare/pages/03_PersonalAccount_01.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
// void main() {
//   runApp(LoginPage());
// }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String _name = '';
  final String _password = '';

  Future<void> _login(BuildContext context) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(nameController.text)
              .get();
      if (userSnapshot.exists) {
        String passwordFromDatabase = userSnapshot.data()!['Password'];

        if (passwordController.text == passwordFromDatabase) {
          String imagepath = userSnapshot.data()!['ImagePath'];
          print('imagepath*-*-*-*-*-*-*-*-* :$imagepath');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PersonalAccountPage(
                accountName: nameController.text,
                profileImage: imagepath,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid password")));
          print('Invalid password');
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("User not found")));
        print('User not found');
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error during login")));
      print('Error during login: $e');
    }
  }

  Widget iconButtonCus(
      String imageSrc, double padding, void Function() onPress) {
    return IconButton(
        style: IconButton.styleFrom(padding: EdgeInsets.all(0)),
        onPressed: onPress,
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(padding),
          child: SvgPicture.asset(
            imageSrc,
            width: 50,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDB4DB),
      resizeToAvoidBottomInset: false,
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/world.png',
                  height: 350,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InputData(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => _login(context),
                      // () {
                      // setState(() {
                      //   String name = nameController.text;
                      //   String password = passwordController.text;
                      //   print('Account Name  : $name');
                      //   print('Account Password: $password');
                      // });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => CreateAnAccountPage()));

                      // Navigator.of(context).pushNamed("/personal_account");
                      // },
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
                ),
                SizedBox(
                  height: 10,
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Center(
                //     child: Text('Or Log in with',
                //         style: TextStyle(color: Colors.white, fontSize: 20))),

                // SocialMedia(context),
                Column(
                  children: [
                    Center(
                        child: Text(
                            '.........................................................',
                            style: TextStyle(
                                color: Color(0xff000000), fontSize: 16))),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreateAnAccountPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff7D4788)),
                          child: SizedBox(
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Create an Account",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ))),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Column InputData() {
    return Column(
      children: [
        TextFormField(
          style: TextStyle(fontFamily: 'Inter'),
          controller: nameController,
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
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: 'ชื่อผู้ใช้',
            labelStyle: TextStyle(
                color: Color(0xff999999),
                fontFamily: 'NotoSansThai',
                fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          style: TextStyle(fontFamily: 'Inter'),
          controller: passwordController,
          // keyboardType: TextInputType.number,
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
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: 'รหัสผ่าน',
            labelStyle: TextStyle(
                color: Color(0xff999999),
                fontFamily: 'NotoSansThai',
                fontSize: 20),
          ),
        ),
      ],
    );
  }
}
