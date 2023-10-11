import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String? name;
  String? image;
  String? number;
 


  ProfileModel({
  
    required this.name,
    required this.image,
    required this.number,
   
  });

  ProfileModel.fromSnapshot(DocumentSnapshot data) {
   
    name = data['name'];
    image = data['image'];
    number = data['number'];
   
  }

  Map<String, dynamic> toSnapshot() {
    return {"name": name, "image":image,"number":number};
  }
}