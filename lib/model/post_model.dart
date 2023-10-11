
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? name;
  String? image;
 


  TaskModel({
  
    required this.name,
    required this.image,
   
  });

  TaskModel.fromSnapshot(DocumentSnapshot data) {
   
    name = data['name'];
    image = data['image'];
   
  }

  Map<String, dynamic> toSnapshot() {
    return {"name": name, "image":image,};
  }
}