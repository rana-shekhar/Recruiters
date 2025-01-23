import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Utiles {
  List<String> cityList = [];

  Future<String> uploadTask (String filePath, String fileName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("jobs").child(fileName); //for folder
    File file = File(filePath);
    UploadTask uploadTask = ref.putFile(file, SettableMetadata(contentType: 'image/jpeg'));
    await uploadTask.whenComplete(() => null);
    String imageurl = await ref.getDownloadURL();
    return imageurl;

  }
  

  Future<void> fetchCities() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('City').get();

      List<String> fetchedCities =
          snapshot.docs.map((doc) => doc['cityName'].toString()).toList();
      cityList = fetchedCities; // Update city list
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }

}