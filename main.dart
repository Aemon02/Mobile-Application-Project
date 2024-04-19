import 'package:airyshare/pages/01_Login_01.dart';
import 'package:airyshare/pages/02_CreateAnAccount_01.dart';
import 'package:airyshare/pages/03_PersonalAccount_01.dart';
import 'package:airyshare/pages/04_Payment_01.dart';
import 'package:airyshare/pages/05_CheckPaymentStatus_01.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const LoginPage(),
        '/create_an_account': (context) => const CreateAnAccountPage(),
        '/personal_account': (context) => const PersonalAccountPage(),
        '/payment': (context) => const PaymentPage(),
        '/check_payment_status': (context) => const CheckPaymentStatusPage(),
      },
      initialRoute: '/',
    );
  }
}
