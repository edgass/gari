import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gari/auth/footer.dart';
import 'package:gari/auth/form.dart';
import 'package:gari/client/client_dashboard.dart';
import 'package:gari/deliver/deliver_home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
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
               // length: 6,
               // defaultPinTheme: defaultPinTheme,
               // focusedPinTheme: focusedPinTheme,
               // submittedPinTheme: submittedPinTheme,
                validator: (s) {
                  return s == '1234' || s == '4321' ? null : 'Code Incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                pinAnimationType: PinAnimationType.scale,
                showCursor: true,
                onCompleted: (pin){
                  if(pin == '1234'){
                    Get.to(()=>ClientDashboard());
                  }else if(pin == '4321'){
                    Get.to(()=>DeliverHome());
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 50,
                  child: ElevatedButton(// foreground
                    onPressed: () { },
                    child: Text('Renvoyer le code',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => apCol),
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Text('Annuler',style: TextStyle(color: apCol),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
