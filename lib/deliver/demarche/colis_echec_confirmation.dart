import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ColisEchecConfirmation extends StatefulWidget {
  const ColisEchecConfirmation({Key? key}) : super(key: key);

  @override
  State<ColisEchecConfirmation> createState() => _ColisEchecConfirmationState();
}

class _ColisEchecConfirmationState extends State<ColisEchecConfirmation> {
  String motif = "absent";
  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    return Column(
      children: [
        RadioListTile(
          title: const Text("Destinataire absent"),
          activeColor: apCol,
          value: "absent",
          groupValue: motif,
          onChanged: (String? value) { setState((){motif = value.toString();});},
        ),
        RadioListTile(
          activeColor: apCol,
          title: const Text("Colis endommagé"),
          value: "endommage",
          groupValue: motif, onChanged: (String? value) { setState((){motif = value.toString();});},
        ),
        RadioListTile(
          activeColor: apCol,
          title: const Text("Erreur destination"),
          value: "erreur",
          groupValue: motif, onChanged: (String? value) { setState((){motif = value.toString();}); },
        ),
        RadioListTile(
          activeColor: apCol,
          title: const Text("Destinataire injoignable"),
          value: "injoingnable",
          groupValue: motif, onChanged: (String? value) { setState((){motif = value.toString();});},
        ),
        RadioListTile(
          activeColor: apCol,
          title: const Text("Retour du colis"),
          value: "retour",
          groupValue: motif, onChanged: (String? value) {setState((){motif = value.toString();});},
        ),
        RadioListTile(
          activeColor: apCol,
          title: const Text("Autre"),
          value: "autre",
          groupValue: motif, onChanged: (String? value) {
            setState((){motif = value.toString();
              Get.back();
            Get.defaultDialog(
              title: 'Autre motif',
              titleStyle: TextStyle(color: apCol,fontWeight: FontWeight.bold),
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Saisir la raison de l’échec de livraison',
                        hintStyle: const TextStyle(color: Colors.grey,fontSize: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: apCol,
                              width: 1
                          ),
                        ),
                      ),
                      maxLength: 100,
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 50,
                      child: ElevatedButton(// foreground
                        onPressed: () { },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)
                              )
                          ),
                          backgroundColor: MaterialStateColor.resolveWith((states) => apCol),
                        ),
                        child: const Text('Envoyer',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ],
              ),

            );
            });},
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: 50,
            child: ElevatedButton(// foreground
              onPressed: () { },
              child: const Text('Envoyer',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)
                    )
                ),
                backgroundColor: MaterialStateColor.resolveWith((states) => apCol),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
