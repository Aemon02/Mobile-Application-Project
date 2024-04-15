import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateAnAccountPage extends StatefulWidget {
  const CreateAnAccountPage({super.key});

  @override
  State<CreateAnAccountPage> createState() => _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends State<CreateAnAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDB4DB),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(fontFamily: 'Inter'),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'ชื่อจริง',
                              labelStyle: TextStyle(
                                  color: Color(0xff999999),
                                  fontFamily: 'NotoSansThai',
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 16), // เพิ่มระยะห่างระหว่าง TextFormField
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(fontFamily: 'Inter'),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelText: 'นามสกุล',
                              labelStyle: TextStyle(
                                  color: Color(0xff999999),
                                  fontFamily: 'NotoSansThai',
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
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
                      labelText: 'อีเมลล์',
                      labelStyle: TextStyle(
                          color: Color(0xff999999),
                          fontFamily: 'NotoSansThai',
                          fontSize: 20),
                      prefixIcon: SizedBox(
                        width: 20,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/email.svg',
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
                      labelText: 'เบอร์โทร',
                      labelStyle: TextStyle(
                          color: Color(0xff999999),
                          fontFamily: 'NotoSansThai',
                          fontSize: 20),
                      prefixIcon: SizedBox(
                        width: 20,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/phone.svg',
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
                      Navigator.of(context).pushNamed("/create_an_account");
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
              Column(
                children: [
                  Center(
                      child: Text(
                          '.........................................................',
                          style:
                              TextStyle(color: Color(0xff000000), fontSize: 16))),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/");
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
                ],
              ),
              SizedBox(
                height: 28.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
