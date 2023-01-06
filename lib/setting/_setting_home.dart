import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gari/auth/_auth.dart';
import 'package:gari/setting/setting_actions.dart';
import 'package:gari/setting/setting_header.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../auth/login.dart';
class SettingHome extends StatelessWidget {
  const SettingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SettingHeader(),
            const SettingActions(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: 50,
                child: ElevatedButton(// foreground
                  onPressed: (){
                    FirebaseAuth.instance.signOut();
                    Get.offAll(()=>const Login());
                  },
                  child: const Text('Se deconnecter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                        )
                    ),
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.redAccent),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
