import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class SettingHeader extends StatelessWidget {
  const SettingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    final _auth = FirebaseAuth.instance;
    return Column(
      children: [
        Image.asset('assets/logo/logo_gari_vert.png',width: 150,),
        GestureDetector(
          onTap: ()=>Get.back(),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: apCol,
                borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(Icons.arrow_back,color: Colors.white,),
          ),
        ),
        SizedBox(height: 15,),
        Text(_auth.currentUser?.phoneNumber ?? "",textAlign: TextAlign.center,style: TextStyle(color: apCol,fontWeight: FontWeight.bold,fontSize: 20),)
      ],
    );
  }
}
