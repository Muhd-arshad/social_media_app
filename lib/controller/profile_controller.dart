import 'package:flutter/material.dart';
import 'package:social_media_app/service/firebaseservices.dart';

class ProfileController extends ChangeNotifier{
FireService fireService =FireService();
  List<dynamic> profilelist =[];
    String name ='';
    String image ='';
    String phone ='';
  Future<void> getllProfile()async{
     profilelist.clear();
    debugPrint('profileCAlling ====');
   final  output = await fireService.fetchProfile();
   debugPrint(output.toString());
   profilelist.addAll(output);
    name=profilelist[0].name;
    image =profilelist[0].image;
   print('nameee===$name');
   print('nameee===$image');
   debugPrint('profilelist=================$profilelist');
  //  return postlist;
   }
}