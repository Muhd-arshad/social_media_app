import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/model/post_model.dart';

class FireService {
  Future<List> fetchdata() async {
    List<TaskModel> list = [];
    try {
      CollectionReference tasks = FirebaseFirestore.instance.collection('post');
      QuerySnapshot querySnapshot =
          await tasks.get(); // Use await to fetch data
      for (var doc in querySnapshot.docs) {
        debugPrint('taskkkk == $tasks');
        debugPrint('lllllllllll == ${querySnapshot.docs}');
        TaskModel task = TaskModel.fromSnapshot(doc);
        list.add(task);
        debugPrint('list ==== $list');
      }
    } catch (e) {
      debugPrint('exception===$e');
    }
    return list;
  }

  Future<List<TaskModel>> fetchProfile() async {
    List<TaskModel> profileList = [];
    try {
      CollectionReference tasks =
          FirebaseFirestore.instance.collection('profile');
      QuerySnapshot querySnapshot =
          await tasks.get(); // Use await to fetch data
      for (var doc in querySnapshot.docs) {
        debugPrint('profiletask == $tasks');
        debugPrint('profilQuery == ${querySnapshot.docs}');
        TaskModel task = TaskModel.fromSnapshot(doc);
        profileList.add(task);
        debugPrint('profilelistservice ==== $profileList');
      }
    } catch (e) {
      debugPrint('exception===$e');
    }
    return profileList;
  }
}
