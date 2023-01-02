import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller/auth_controller.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    Color apCol = Theme.of(context).primaryColor;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/logo/logo_gari_vert.png",height: 100,),
        const SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.7,
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: const Icon(Icons.phone_in_talk),
              prefixText: '+221',
              hintText: 'Numéro de téléphone',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide.none,
              ),

            ),
            onChanged: (value){
              authController.setNumberToVerify(value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            height: 50,
            child: GetBuilder<AuthController>(
              builder:(value)=> ElevatedButton(// foreground
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    )
                  ),
                  backgroundColor: MaterialStateColor.resolveWith((states) => apCol),
                  
                ), 
                onLongPress: null,
                onPressed:value.authState==AuthState.sending ? null : () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  authController.verifyNumber("+221${authController.numberToVerify}");
                },
                child: value.authState == AuthState.sending ? CircularProgressIndicator(color: Colors.white,) : const Text('Se connecter',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),) ,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
