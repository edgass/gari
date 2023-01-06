import 'package:flutter/material.dart';
import 'package:gari/client/contact_dialog.dart' as contact;
class SettingActions extends StatelessWidget {
  const SettingActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String phoneNumber = "+221784029122";
    String message = "Bonjour, je suis livreur. Je souhaite intégrer Gari et gagner de l'argent. ";
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          const Text("Et si vous completiez votre profil !",style: TextStyle(fontStyle: FontStyle.italic),),
          const SizedBox(height: 5,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            height: 50,
            child: ElevatedButton(// foreground
              onPressed: null,
              child: const Text("Ajouter mes informations"),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    )
                ),
             //   backgroundColor: MaterialStateColor.resolveWith((states) => Colors.redAccent),
              ),
            ),
          ),


          const SizedBox(height: 35,),

          const Text("Vous etes livreur ? Vous souhaitez travailler avec Gari ?",style: TextStyle(fontStyle: FontStyle.italic),),
          const SizedBox(height: 5,),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            height: 50,
            child: ElevatedButton(// foreground
              onPressed: (){
                contact.contactDialog().openContactDialog(context, "Envoyer une demande", phoneNumber, message);
              },
              child: const Text("Envoyer une demande"),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    )
                ),
              //  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
