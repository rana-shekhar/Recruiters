import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recruiters/model/areamodel.dart';
import 'package:recruiters/model/citymodel.dart';

class Utiles {
  List<City> cityList = [];
  List<Area> areaList = [];

  Future<String> uploadTask(String filePath, String fileName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("jobs").child(fileName); //for folder
    File file = File(filePath);
    UploadTask uploadTask =
        ref.putFile(file, SettableMetadata(contentType: 'image/jpeg'));
    await uploadTask.whenComplete(() => null);
    String imageurl = await ref.getDownloadURL();
    return imageurl;
  }

  Future<void> fetchCities() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('City').get();

      List<City> fetchedCities =
          snapshot.docs.map((doc) => City.fromJson(doc.data())).toList();
      cityList = fetchedCities;
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }

  Future<void> fetchAreas(String? cityId) async {
 

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Area')
          .where('cityId', isEqualTo: cityId)
          .get();
      List<Area> fetchAreas =
          snapshot.docs.map((doc) => Area.fromJson(doc.data())).toList();
      areaList = fetchAreas;
     
    } catch (e) {
      print('Error fetching areas: $e');
    }
  }
}
