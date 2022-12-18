import 'package:flutter/material.dart';
import 'package:gari/appBar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'client_home.dart';
class ClientDashboard extends StatelessWidget {
  const ClientDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: MyAppBar(pageTitle: 'Acceuil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Que souhaitez vous faire ?",textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic),),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: 100,
                child: ElevatedButton(// foreground
                  onPressed: () { },
                  child: Text('Commander une livraison',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => apCol),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: 100,
                child: ElevatedButton(// foreground
                  onPressed: () {
                    Get.to(()=>ClientHome());
                  },
                  child: Text('Suivre mon colis',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => apCol),
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
