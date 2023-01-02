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
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: 50,
            child: ElevatedButton(// foreground
              onPressed: null,
              child: Text("Ajouter mes informations"),
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


          SizedBox(height: 35,),

          Text("Vous etes livreur ? Vous souhaitez travailler avec Gari ?",style: TextStyle(fontStyle: FontStyle.italic),),
          SizedBox(height: 5,),
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: 50,
            child: ElevatedButton(// foreground
              onPressed: null,
              child: Text("Envoyer une demande"),
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
