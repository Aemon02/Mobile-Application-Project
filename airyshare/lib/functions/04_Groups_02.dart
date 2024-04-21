import 'package:cloud_firestore/cloud_firestore.dart';

void createGroup({
  String? groupname,
  imagepath,
  List<String>? member,
}) {
  final docUser =
      FirebaseFirestore.instance.collection('Groups').doc('$groupname');
  final json = {
    'GroupName': groupname,
    'ImagePath': imagepath,
    'Member': member,
  };
  docUser.set(json);
}

class GroupData {
  final String? groupName;
  final String? imagePath;
  final List<String>? members;

  GroupData({this.groupName, this.imagePath, this.members});
}

void addNewPaymentItem({
  required String groupName,
  required Map<String, dynamic> newItemData,
}) {
  final DocumentReference paymentDocRef = FirebaseFirestore.instance
      .collection('Groups')
      .doc(groupName)
      .collection('ItemList')
      .doc(newItemData['programName']); 
  paymentDocRef.set({
    'groupName': groupName,
    'ItemList': newItemData,
  }).then((_) {
    print('เพิ่มรายการใหม่สำเร็จ: ${paymentDocRef.id}');
  }).catchError((error) {
    print('เกิดข้อผิดพลาดในการเพิ่มรายการใหม่: $error');
  });
}

void updateGroupItem({
  required String groupName,
  required Map<String, dynamic> itemList,
}) {
  try {
    final docRef =
        FirebaseFirestore.instance.collection('Groups').doc(groupName);

    final data = {
      'GroupName': groupName,
      'ItemList': itemList,
    };

    docRef.update(data);
  } catch (e) {
    print('Error updating group item: $e');
  }
}
