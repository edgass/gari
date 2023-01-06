import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gari/auth/login.dart';
import 'package:gari/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'package:pinput/pinput.dart';import 'controller/auth_controller.dart';
class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    AuthController authController = Get.find<AuthController>();
    Color apCol = Theme.of(context).primaryColor;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20,left: 18,right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo/logo_gari_vert.png",height: 100,),
              SizedBox(height: 10,),
              Text("Vérification",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              Text("Un code a été envoyé au 77 247 77 30",textAlign: TextAlign.center),
              SizedBox(height: 25,),
              SizedBox(height: 10,),
              Pinput(
               length: 6,
                controller: pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:AndroidSmsAutofillMethod.smsRetrieverApi,
               // defaultPinTheme: defaultPinTheme,
               // focusedPinTheme: focusedPinTheme,
               // submittedPinTheme: submittedPinTheme,
            /*    validator: (s) {
                  return s == '1234' || s == '4321' ? null : 'Code Incorrect';
                },*/
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                pinAnimationType: PinAnimationType.scale,
                showCursor: true,
                onCompleted: (pin) async{
                  try{
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: authController.verify, smsCode: pin);
                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    print("Success : User is Signed");
                  }catch(e){
                    print("Erreur lors de la verification du code");
                  }
                },
              ),
/*              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 50,
                  child: ElevatedButton(// foreground
                    onPressed: ()=>{

                    },
                    child: Text('Valider',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            )
                        ),
                        backgroundColor: MaterialStateColor.resolveWith((states) => apCol),
                      ),
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 50,right: 50),
                child: Column(
               //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: (){
                          null;
                        },
                        child: Text('Valider',style: TextStyle(color: apCol,fontSize: 20),)),
                    SizedBox(height: 20,),
                    GetBuilder<AuthController>(
                      builder:(value)=> value.authState == AuthState.sending ? const CircularProgressIndicator() : GestureDetector(
                          onTap: (){
                           authController.verifyNumber(authController.numberToVerify);
                          },
                          child: Text('Renvoyer le code',style: TextStyle(color: Colors.green),)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
