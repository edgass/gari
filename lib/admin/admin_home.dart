import 'package:flutter/material.dart';
import 'package:gari/appBar.dart';
import 'package:gari/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    Color apCol = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBar(pageTitle: "Admin",isHome: true),
        preferredSize: Size.fromHeight(85),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Création compte livreur",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.7,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.phone_in_talk),
                  prefixText: '+221',
                  hintText: 'Numéro du livreur',
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
                      authController.createDeliver("+221${authController.numberToVerify}");
                    },
                    child: value.authState == AuthState.sending ? CircularProgressIndicator(color: Colors.white,) : const Text('Créer le compte',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),) ,
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
