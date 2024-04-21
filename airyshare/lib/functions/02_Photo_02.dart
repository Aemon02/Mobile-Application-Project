import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageManagementPage extends StatefulWidget {
  @override
  _ImageManagementPageState createState() => _ImageManagementPageState();
}

class _ImageManagementPageState extends State<ImageManagementPage> {
  late XFile _imageFile;
  late String _imageUrl;

  _ImageManagementPageState()
      : _imageFile = XFile(''),
        _imageUrl = '';

  // เลือกรูปภาพจาก Gallery
  Future<void> _uploadImageToFirebaseStorage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      print('No image selected');
      return;
    }

    setState(() {
      _imageFile = pickedImage;
    });
    print("Image File : $_imageFile");

    // Attempt upload with retry mechanism
    int maxRetries = 3;
    int retryCount = 0;
    bool uploadSuccess = false;

    while (!uploadSuccess && retryCount < maxRetries) {
      try {
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference ref =
            storage.ref().child('images/${DateTime.now().toString()}');

        // Upload the file
        UploadTask uploadTask = ref.putFile(File(_imageFile.path));
        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadURL = await taskSnapshot.ref.getDownloadURL();

        setState(() {
          _imageUrl = downloadURL;
        });

        uploadSuccess = true;
        print('Image uploaded successfully!');
      } catch (e) {
        print('Error uploading image: $e');
        retryCount++;
        print('Retrying upload...');
        await Future.delayed(
            Duration(seconds: 2)); // Wait for 2 seconds before retrying
      }
    }

    if (!uploadSuccess) {
      print('Upload failed after $maxRetries attempts');
    }
  }

  void _addImageUrlToFirestore() {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('images').add({
        'imageUrl': _imageUrl,

      });
    } catch (e) {
      print('เกิดข้อผิดพลาดในการเพิ่ม URL ใน Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('จัดการรูปภาพ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile == null
                ? Text('ไม่มีรูปภาพที่ถูกเลือก')
                : Image.file(File(_imageFile.path)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('เลือกรูปภาพ'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_imageFile != null) {
                  _uploadImageToFirebaseStorage();
                }
              },
              child: Text('อัปโหลดรูปภาพ'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_imageUrl != null) {
                  _addImageUrlToFirestore();
                }
              },
              child: Text('เพิ่ม URL ใน Firestore'),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: ImageManagementPage(),
//   ));
// }
