
import 'package:cloud_firestore/cloud_firestore.dart';

void createUser(
    { String? 
      firstname,
      lastname,
      accountname,
      email,
      password,
      phone,
      bank,
      bankaccountname,
      bankaccountnumber,
    }) {
  final docUser = FirebaseFirestore.instance.collection('Users').doc('$accountname');
  final json = {
    'FirstName': firstname,
    'LastName': lastname,
    'AccountName': accountname,
    'Email': email,
    'Password': password,
    'Phone': phone,
    'Bank': bank,
    'BankAccountName': bankaccountname,
    'BankAccountNumber': bankaccountnumber,
  };
  docUser.set(json);
}


Future<void> updateBankInfo({
  required String accountname,
   String? bank,
   String? bankaccountname,
   String? bankaccountnumber,
}) async {
  try {
    // ดึงข้อมูลของผู้ใช้จากฐานข้อมูล Firestore
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(accountname)
            .get();

    if (userSnapshot.exists) {
      // อัปเดตข้อมูลธนาคารของผู้ใช้
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(accountname)
          .update({
        'Bank': bank,
        'BankAccountName': bankaccountname,
        'BankAccountNumber': bankaccountnumber,
      });
      print('Bank information updated successfully');
    } else {
      print('User not found');
      // Handle user not found
    }
  } catch (e) {
    print('Error updating bank information: $e');
    // Handle error updating bank information
  }
}
