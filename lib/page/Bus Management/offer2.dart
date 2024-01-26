import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class Offer2 extends StatefulWidget {
  const Offer2({Key? key}) : super(key: key);

  @override
  State<Offer2> createState() => _Offer2State();
}

class _Offer2State extends State<Offer2> {
  late FirebaseStorage _storage;
  late Reference _storageRef;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  void _initializeFirebase() async {
    await Firebase.initializeApp();
    _storage = FirebaseStorage.instance;
    _storageRef = _storage.ref();
  }

  File? _imageFile;
  List<String> _imageUrls = [];

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      // Upload the image to Firebase storage
      Reference ref = _storageRef.child('images/${DateTime.now()}.png');
      UploadTask uploadTask = ref.putFile(_imageFile!);
      await uploadTask.whenComplete(() => null);

      // Get the URL of the uploaded image
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        _imageUrls.add(downloadUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    _imageUrls[index],
                    width: 200,
                    height: 200,
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
}
