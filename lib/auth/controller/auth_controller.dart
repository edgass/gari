
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gari/home_page.dart';
import 'package:get/get.dart';

import '../otp.dart';

enum AuthState {
  initial,
  sending,
  codeSent,
  completed,
  failed,
  timeout

}

class AuthController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;
  final docUser = FirebaseFirestore.instance.collection('users');

  AuthState authState = AuthState.initial;
  String verify = "";
  String numberToVerify = "";

  setAuthState(AuthState state){
    authState = state;
    update();
  }

  setVerifyId(String verif){
    verify = verif;
    update();
  }

  setNumberToVerify(String number){
    numberToVerify = number;
    update();
  }


  void verifyNumber(String phoneNumber) async{
    setAuthState(AuthState.sending);
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async{
        await FirebaseAuth.instance
            .signInWithCredential(credential);
        setAuthState(AuthState.completed);
      /*  FirebaseAuth.instance
            .signInWithCredential(credential).then((cred) => {

        });*/
        setAuthState(AuthState.completed);
    },
      verificationFailed: (FirebaseAuthException e) {
        setAuthState(AuthState.failed);
        Get.snackbar("Erreur OTP", "Une erreur est survenue, veuillez réessayer",colorText: Colors.white,backgroundColor: Colors.red,snackPosition:SnackPosition.BOTTOM);
    },
      codeSent: (String verificationId, int? resendToken) {
        setVerifyId(verificationId);
        setAuthState(AuthState.codeSent);
        Get.to(()=> const Otp());
    },
      codeAutoRetrievalTimeout: (String verificationId) {
        setAuthState(AuthState.timeout);
    },

    );

}

  void createDeliver(String phoneNumber) async{
    setAuthState(AuthState.sending);
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async{
       /* await FirebaseAuth.instance
            .signInWithCredential(credential);
        setAuthState(AuthState.completed);*/
          FirebaseAuth.instance
            .signInWithCredential(credential).then((cred) => {
          FirebaseFirestore.instance.collection('users').doc(cred.user?.uid).set({
            'role' : 'deliver'
          })
        });
        setAuthState(AuthState.completed);
        Get.to(()=>HomePage());
      },
      verificationFailed: (FirebaseAuthException e) {
        setAuthState(AuthState.failed);
      },
      codeSent: (String verificationId, int? resendToken) {
        setVerifyId(verificationId);
        setAuthState(AuthState.codeSent);
        //   Get.to(()=>const Otp());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setAuthState(AuthState.timeout);
      },

    );

  }
}