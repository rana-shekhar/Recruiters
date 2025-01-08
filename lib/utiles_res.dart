import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Utilesres{
Future<String> uploadResume (String filePath, String fileName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("Resume").child(fileName); //for folder
    File file = File(filePath);
    UploadTask uploadTask = ref.putFile(file, SettableMetadata(contentType: 'application/pdf'));
    await uploadTask.whenComplete(() => null);
    String resumeurl = await ref.getDownloadURL();
    return resumeurl;
  }
}