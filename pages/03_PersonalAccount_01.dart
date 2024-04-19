import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalAccountPage extends StatefulWidget {
  const PersonalAccountPage({super.key});

  @override
  State<PersonalAccountPage> createState() => _PersonalAccountPageState();
}

class _PersonalAccountPageState extends State<PersonalAccountPage> {
  Column itemGroup(String imageSrc, String text, BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Color(0xff62226D), width: 1.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imageSrc,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
          width: 80,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'NotoSansThai',
                  color: Color(0xff62226D),
                  fontSize: 14.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Container itemPayment() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
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
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/payment");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/images/01.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'เที่ยวภูเก็ต',
                      style: TextStyle(
                        color: Color(0xff62226D),
                        fontFamily: 'NotoSansThai',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'รายการ : อาหารเย็น',
                      style: TextStyle(
                        color: Color(0xff62226D),
                        fontFamily: 'NotoSansThai',
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                '140฿',
                style: TextStyle(
                  color: Color(0xff62226D),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDB4DB),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Container
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.only(right: 16.0),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 16.0, top: 16.0, bottom: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(48.0),
                                bottomLeft: Radius.circular(48.0),
                                bottomRight: Radius.circular(68.0)),
                            color: Color(0xffE8C0DB),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/images/wendy.png'),
                              Text('Wendy',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 40.0)),
                            ],
                          ),
                        ),
                      ),
                      // Right Container
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Column(
                          children: [
                            IconButton(
                              style: IconButton.styleFrom(
                                  padding: EdgeInsets.all(0)),
                              onPressed: () {},
                              icon: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: Colors.white,
                                ),
                                // padding: EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/svg/setting.svg',
                                  // width: 50,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            IconButton(
                              style: IconButton.styleFrom(
                                  padding: EdgeInsets.all(0)),
                              onPressed: () {},
                              icon: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/svg/money.svg',
                                  // width: 50,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            IconButton(
                                style: IconButton.styleFrom(
                                    padding: EdgeInsets.all(0)),
                                onPressed: () {},
                                icon: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/svg/graph.svg',
                                    // width: 50,
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            IconButton(
                                style: IconButton.styleFrom(
                                    padding: EdgeInsets.all(0)),
                                onPressed: () {},
                                icon: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/svg/wallet.svg',
                                    // width: 50,
                                  ),
                                )),
                          ],
                        ),
                        // color: Colors.white,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Group",
                        style: TextStyle(
                            color: Color(0xff62226D),
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.amber,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              itemGroup('assets/images/01.png', 'เที่ยวภูเก็ต',
                                  context),
                              SizedBox(
                                width: 10.0,
                              ),
                              itemGroup('assets/images/02.png', 'นัดกินข้าว',
                                  context),
                              SizedBox(
                                width: 10.0,
                              ),
                              itemGroup('assets/images/03.png', 'ไปดูคอน BP',
                                  context),
                              SizedBox(
                                width: 10.0,
                              ),
                              IconButton(
                                  style: IconButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          left: 4.0, bottom: 20.0)),
                                  onPressed: () {},
                                  icon: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      'assets/svg/plus.svg',
                                      // width: 50,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
              color: Color(0xffF7F4F5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment",
                  style: TextStyle(
                      color: Color(0xff62226D),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.4,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        itemPayment(),
                        SizedBox(
                          height: 10.0,
                        ),
                        itemPayment(),
                        SizedBox(
                          height: 10.0,
                        ),
                        itemPayment(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
