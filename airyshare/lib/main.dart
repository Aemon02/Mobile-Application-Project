import 'package:airyshare/firebase_options.dart';
import 'package:airyshare/pages/01_AddBank_02.dart';
import 'package:airyshare/pages/01_Login_01.dart';
import 'package:airyshare/pages/02_CreateAccount_01.dart';
import 'package:airyshare/pages/02_CreateGroup_02.dart';
import 'package:airyshare/pages/03_GroupAccount_02.dart';
import 'package:airyshare/pages/03_PersonalAccount_01.dart';
import 'package:airyshare/pages/04_AddPaymentList_02.dart';
import 'package:airyshare/pages/04_Payment_01.dart';
import 'package:airyshare/pages/05_CheckPaymentStatus_01.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );          

  runApp(MyApp());
}
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: 
      // CheckPaymentStatusPage(),
      LoginPage(),
      // AddPaymentListPage(groupName: 'Travel to Phuket'),
    );
  }
  
}
                 