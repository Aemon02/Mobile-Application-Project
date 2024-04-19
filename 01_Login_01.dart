import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/world.png'),
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
              Column(
                children: [
                  TextFormField(
                    style: TextStyle(fontFamily: 'Inter'),
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
                          EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'ชื่อผู้ใช้',
                      labelStyle: TextStyle(
                          color: Color(0xff999999),
                          fontFamily: 'NotoSansThai',
                          fontSize: 20),
                      prefixIcon: SizedBox(
                        width: 20,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/user.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(fontFamily: 'Inter'),
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
                          EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'รหัสผ่าน',
                      labelStyle: TextStyle(
                          color: Color(0xff999999),
                          fontFamily: 'NotoSansThai',
                          fontSize: 20),
                      prefixIcon: SizedBox(
                        width: 20,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/lock.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/personal_account");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7D4788)),
                    child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text('Or Log in with',
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                // color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconButtonCus('assets/svg/x.svg', 8, () {
                      Navigator.of(context).pushNamed("/personal_account");
                    }),
                    SizedBox(width: 12),
                    iconButtonCus('assets/svg/fb.svg', 4, () {
                      Navigator.of(context).pushNamed("/personal_account");
                    }),
                    SizedBox(width: 12),
                    iconButtonCus('assets/svg/google.svg', 4, () {
                      Navigator.of(context).pushNamed("/personal_account");
                    }),
                    SizedBox(width: 12),
                    iconButtonCus('assets/svg/ig.svg', 8, () {
                      Navigator.of(context).pushNamed("/personal_account");
                    }),
                  ],
                ),
              ),
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
                          Navigator.of(context).pushNamed("/create_an_account");
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
        ),
      ),
    );
  }
}
