import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Utiles {
  Future<String> uploadTask (String filePath, String fileName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("jobs").child(fileName); //for folder
    File file = File(filePath);
    UploadTask uploadTask = ref.putFile(file, SettableMetadata(contentType: 'image/jpeg'));
    await uploadTask.whenComplete(() => null);
    String imageurl = await ref.getDownloadURL();
    return imageurl;

  }
}