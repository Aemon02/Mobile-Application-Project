// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_super_parameters

import 'package:airyshare/pages/01_AddBank_02.dart';
import 'package:airyshare/pages/01_Login_01.dart';
import 'package:airyshare/pages/02_CreateGroup_02.dart';
import 'package:airyshare/pages/03_GroupAccount_02.dart';
import 'package:airyshare/pages/04_Payment_01.dart';
import 'package:airyshare/pages/05_CheckPaymentStatus_01.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalAccountPage extends StatefulWidget {
  final String accountName;
  final String profileImage;

  const PersonalAccountPage({
    Key? key,
    required this.accountName,
    required this.profileImage,
  }) : super(key: key);

  

  @override
  State<PersonalAccountPage> createState() => _PersonalAccountPageState();
}

class _PersonalAccountPageState extends State<PersonalAccountPage> {

  List<String> members = [
    'aem',
    'babana',
    'cry',
    'mnm',
    'test1',
    'test2',
    'umi'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDB4DB),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [myProfile(context), paymentList(context)],
      ),
    );
  }

  Container myProfile(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
        child: Column(
          children: [
            ProfileAccount(widget.accountName, widget.profileImage, context),
            // ProfileAccount('assets/images/profile.webp', context),
            myGroup(context)
          ],
        ),
      ),
    );
  }

  Container paymentList(BuildContext context) {
    return Container(
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
          ),
        ],
      ),
    );
  }

  Column myGroup(BuildContext context) {
    return Column(
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
                IconButton(
                    style: IconButton.styleFrom(
                        padding: EdgeInsets.only(left: 4.0, bottom: 20.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateGroupPage(
                                  accountName: widget.accountName,
                                  profileImage: widget.profileImage)));
                    },
                    icon: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Color.fromARGB(255, 152, 99, 168),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.group_add,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  width: 16.0,
                ),
                itemGroup('assets/images/wendy.png', 'เที่ยวภูเก็ต', context),
                SizedBox(
                  width: 10.0,
                ),
                itemGroup('assets/images/h10.jpg', 'นัดกินข้าว', context),
                SizedBox(
                  width: 10.0,
                ),
                itemGroup('assets/images/03.png', 'ไปดูคอน BP', context),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Row ProfileAccount(accountName, pathImage, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.only(top: 25, right: 16.0),
          child: Container(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
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
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(pathImage),
                  foregroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                Text(
                  accountName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 45.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Right Container
        munuContro(context)
      ],
    );
  }

  Container munuContro(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 25,
      ),
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        children: [
          IconButton(
            style: IconButton.styleFrom(padding: EdgeInsets.all(0)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 152, 99, 168),
                ),
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                )),
          ),
          buttonMenu(Icons.attach_money, CheckPaymentStatusPage()),
          buttonMenu(Icons.auto_graph_sharp, CheckPaymentStatusPage()),
          buttonMenu(
              Icons.account_balance_wallet_rounded, CheckPaymentStatusPage()),
        ],
      ),
      // color: Colors.white,
    );
  }

  IconButton buttonMenu(icon, Widget page) {
    return IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      icon: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromARGB(255, 152, 99, 168),
          ),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Icon(
            icon,
            color: Colors.white,
          )),
    );
  }

  Column itemGroup(String imageSrc, String text, BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.18,
          height: MediaQuery.of(context).size.width * 0.18,
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
        Container(
          width: 80,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'NotoSansThai',
                  color: Color(0xff62226D),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => GroupAccountPage(
        //           groupName: 'เที่ยวไทย',
        //           groupImagePath:'assets/images/h10.jpg',
        //           members: members
        //         ),
        //       ),
        //     );
        //   },
        // )
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentPage()),
          );
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
}
