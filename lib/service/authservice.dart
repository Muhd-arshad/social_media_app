import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class Authservice {
  static String otpcode ='';
static  String _verificationId = "";
 static verifyPhonenumber(String phonenumber)async{
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: phonenumber ,
  verificationCompleted: (PhoneAuthCredential credential) {
    otpcode = credential.smsCode! ;
    log(otpcode);
  },
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
     _verificationId = verificationId;
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
  }
   static Future<void> verifyOtp(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId , smsCode: otp);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}