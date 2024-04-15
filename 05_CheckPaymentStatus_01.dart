import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckPaymentStatusPage extends StatefulWidget {
  const CheckPaymentStatusPage({super.key});

  @override
  State<CheckPaymentStatusPage> createState() => _CheckPaymentStatusPageState();
}

class _CheckPaymentStatusPageState extends State<CheckPaymentStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDB4DB),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 4,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100.0),
                        topRight: Radius.circular(60.0)),
                    color: Color(0xff897BBF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'อาหารเย็น',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'NotoSansThai'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '฿470',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'NotoSansThai'),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 4,
                  padding: EdgeInsets.only(left: 8.0),
                  child: Image.asset('assets/images/wallet.png'),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.4,
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ยังไม่ได้จ่าย',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'NotoSansThai',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      width: 24.0,
                                      child: Image.asset(
                                          'assets/images/avatar_01.png')),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    '@เด็กหญิงเอ',
                                    style: TextStyle(
                                        color: Color(0xffFE0808),
                                        fontSize: 14,
                                        fontFamily: 'NotoSansThai'),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '140 บาท',
                              style: TextStyle(
                                  color: Color(0xffFE0808),
                                  fontSize: 14,
                                  fontFamily: 'NotoSansThai'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 32.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ค่าข้าวไข่เจียว x5',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                    Text(
                                      '54 บาท',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ค่าน้ำมะนาว x2',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                    Text(
                                      '40 บาท',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ค่าขนมปัง x3',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                    Text(
                                      '55 บาท',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'จ่ายแล้ว',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'NotoSansThai',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      width: 24.0,
                                      child: Image.asset(
                                          'assets/images/avatar_02.png')),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    '@เด็กหญิงเอ',
                                    style: TextStyle(
                                        color: Color(0xff42B462),
                                        fontSize: 14,
                                        fontFamily: 'NotoSansThai'),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '140 บาท',
                              style: TextStyle(
                                  color: Color(0xff42B462),
                                  fontSize: 14,
                                  fontFamily: 'NotoSansThai'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 32.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ค่าข้าวไข่เจียว x5',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                    Text(
                                      '54 บาท',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ค่าน้ำมะนาว x2',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                    Text(
                                      '40 บาท',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ค่าขนมปัง x3',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                    Text(
                                      '55 บาท',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 14.0,
                                          fontFamily: 'NotoSansThai'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            padding: EdgeInsets.only(
                left: 24.0, bottom: 50.0, right: 24.0, top: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'บัญชีรับเงิน',
                        style: TextStyle(
                            fontFamily: 'NotoSansThai',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        width: MediaQuery.of(context).size.width,
                        // height: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Row(
                              children: [
                                Image.asset('assets/images/bank.png'),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'นางสาว เอบีซีดี อีเอฟจี',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NotoSansThai',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'ธ.กสิกรไทย 1234567890',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NotoSansThai',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                            Image.asset('assets/images/avatar_03.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 120.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/back2.svg',
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
