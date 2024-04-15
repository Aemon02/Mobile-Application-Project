import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDB4DB),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.835,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 32.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          style:
                              IconButton.styleFrom(padding: EdgeInsets.all(0)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.white,
                            ),
                            // padding: EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/svg/back.svg',
                              // width: 50,
                            ),
                          ),
                        ),
                        Text(
                          'เที่ยวภูเกต',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontFamily: 'NotoSansThai',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'อาหารเย็น',
                          style: TextStyle(
                              color: Color(0xff3B1542),
                              fontSize: 25,
                              fontFamily: 'NotoSansThai',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(64, 0, 0, 0),
                                offset: const Offset(
                                  0.0,
                                  4.0,
                                ),
                                blurRadius: 4.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "total spending",
                                    style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "฿560",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                width: 58,
                                child:
                                    Image.asset('assets/images/icon_money.png'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.0),
                              // height: 83,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(64, 0, 0, 0),
                                    offset: const Offset(
                                      0.0,
                                      4.0,
                                    ),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Paid",
                                        style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "฿140",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/svg/next.svg',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 6.0),
                              height: 83,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xffB999CE),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(64, 0, 0, 0),
                                    offset: const Offset(
                                      0.0,
                                      4.0,
                                    ),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Image.asset('assets/images/avatar.png'),
                            ),
                          ],
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'บันทึก',
                            labelStyle: TextStyle(
                                color: Color(0xff999999),
                                fontFamily: 'NotoSansThai',
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.2,
              // color: Colors.black,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.6,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      children: [
                        IconButton(
                          style:
                              IconButton.styleFrom(padding: EdgeInsets.all(0)),
                          onPressed: () {},
                          icon: Container(
                            height: 48,
                            width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Color(0xffB999CE),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(64, 0, 0, 0),
                                  offset: const Offset(
                                    0.0,
                                    4.0,
                                  ),
                                  blurRadius: 4.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/svg/pic.svg',
                              // width: 50,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/check_payment_status");
                          },
                          child: Container(
                            height: 48,
                            width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Color(0xff7D4789),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(64, 0, 0, 0),
                                  offset: const Offset(
                                    0.0,
                                    4.0,
                                  ),
                                  blurRadius: 4.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'ตกลง',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/images/slip.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
