// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:airyshare/functions/01_AppBar_02.dart';
import 'package:airyshare/pages/02_CreateAccount_01.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/dropdown.dart';

class AddBankPage extends StatefulWidget {
  const AddBankPage({super.key});

  @override
  State<AddBankPage> createState() => _AddBankPageState();
}

class _AddBankPageState extends State<AddBankPage> {
  final TextEditingController bankAccountNameController =
      TextEditingController();
  final TextEditingController bankAccountNumberController =
      TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final List<String> bankList = [
    'SCB',
    'KBANK',
    'KTB',
    'BBL',
    'TTB',
    'GSB',
    'BAY',
    'BAAC',
  ];
  String? selectedValue;

  final String _bankAccountName = '';
  final String _bankAccountNumber = '';
  String? _bankName;

  final String topicAccountName = 'ชื่อบัญชี';
  final String topicAccountNumber = 'ชื่อบัญชี';

  @override
  void dispose() {
    bankNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffCDB4DB),
      appBar: MyAppBar.build(context),
      body: Column(
        children: [
          title(),
          inputBankAccount(topicAccountName, bankAccountNameController),
          chooseBank(),
          inputBankAccount(topicAccountNumber, bankAccountNumberController),
          buttonOK(context),
          Container(child: Image.asset('assets/images/cash.png', height: 300,),)
        ],
      ),
    );
  }

  Padding buttonOK(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  String _bankAccountName = bankAccountNameController.text;
                  String _bankAccountNumber = bankAccountNumberController.text;
                  print('Account Name   : $_bankAccountName');
                  print('Bank Name      : $_bankName');
                  print('Account Number : $_bankAccountNumber');
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAnAccountPage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7D4788)),
              child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      "ตกลง",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
              )
          ),
        );
  }

  Padding chooseBank() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'เลือกธนาคาร',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 45, 6, 51)),
          ),
          DropdownButtonFormField<String>(
            icon: Icon(Icons.arrow_drop_down_outlined),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'เลือกธนาคาร',
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(),
            ),
            isExpanded: true,
            value: _bankName,
            items: bankList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _bankName = newValue;
                  print('Bank Name $_bankName');
                });
              }
            },
          )
        ],
      ),
    );
  }

  Padding inputBankAccount(topic, textController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topic,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 45, 6, 51)),
          ),
          TextField(
            // controller: bankAccountNameController,
            controller: textController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                // hintText: 'ชื่อบัญชี',
                hintText: topic,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8)),
          ),
        ],
      ),
    );
  }

  Container title() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Bank\nAccount',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 45, 6, 51)),
          ),
        ],
      ),
    );
  }

  // AppBar appbar(BuildContext context) {
  //   return AppBar(
  //     backgroundColor: Color(0xffCDB4DB),
  //     leading: IconButton(
  //       icon: Icon(Icons.arrow_back_rounded),
  //       onPressed: () => Navigator.pop(context),
  //     ),
  //   );
  // }
}
