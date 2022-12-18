import 'package:flutter/material.dart';
class SettingActions extends StatelessWidget {
  const SettingActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          Text("Et si vous completiez votre profil !",style: TextStyle(fontStyle: FontStyle.italic),),
          SizedBox(height: 5,),
          ElevatedButton(
              onPressed: null,
              child: Text("Ajouter mes informations")),


          SizedBox(height: 35,),

          Text("Vous etes livreur ? Vous souhaitez travailler avec Gari ?",style: TextStyle(fontStyle: FontStyle.italic),),
          SizedBox(height: 5,),
          ElevatedButton(
              onPressed: null,
              child: Text("Envoyer une demande"))
        ],
      ),
    );
  }
}
