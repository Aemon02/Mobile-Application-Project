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
    'Member': member
  };
  docUser.set(json);
}

class GroupData {
  final String? groupName;
  final String? imagePath;
  final List<String>? members;

  GroupData({this.groupName, this.imagePath, this.members});
}

class GroupDataProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<GroupData?> getGroupData(String groupName) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('Groups').doc(groupName).get();

      if (snapshot.exists) {
        return GroupData(
          groupName: snapshot['GroupName'],
          imagePath: snapshot['ImagePath'],
          members: List<String>.from(snapshot['Member']),
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching group data: $e');
      return null;
    }
  }
}