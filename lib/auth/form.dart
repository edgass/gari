import 'package:flutter/material.dart';
import 'package:gari/auth/otp.dart';
import 'package:get/get.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/logo/logo_gari_vert.png",height: 100,),
        const SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: const Icon(Icons.phone_in_talk),
              prefixText: '+221',
              hintText: 'Numéro de téléphone',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            height: 50,
            child: ElevatedButton(// foreground
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => apCol)
              ),
              onPressed: () { Get.to(()=>const Otp());},
              child: const Text('Connexion',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Switch(
                  activeColor: Colors.blue,
                    value: true, onChanged: null),
                Text("Se souvenir de moi")
              ],
            ),
          ),
        )
      ],
    );
  }
}
