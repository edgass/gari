import 'package:flutter/material.dart';
import 'package:gari/appBar.dart';
import 'package:gari/deliver/deliver_home.dart';
import 'package:gari/deliver/search_commands/search_command_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DeliverDashboard extends StatelessWidget {
  const DeliverDashboard({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Text("Que souhaitez vous faire ?",textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic),),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(()=>const DeliverHome());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: apCol,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Demarrer une livraison',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(),
                              Image.asset("assets/images/moto.png"),
                              Image.asset("assets/images/auto.png"),
                              SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>Get.to(()=>const SearchCommandPage()),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: apCol,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Poursuivre une livraison',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          Image.asset("assets/images/coli.png"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
