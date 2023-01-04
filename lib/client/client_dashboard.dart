import 'package:flutter/material.dart';
import 'package:gari/appBar.dart';
import 'package:gari/client/tracking_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'client_home.dart';
class ClientDashboard extends StatelessWidget {
   ClientDashboard({Key? key}) : super(key: key);
  String phoneNumber = '00221784029122';
  String message = 'Bonjour GARI, je voudrais commander une livraison. Merci';
   _makingPhoneCall() async {
     var url = Uri.parse("tel:$phoneNumber");
     if (await canLaunchUrl(url)) {
       await launchUrl(url);
     } else {
       throw 'Could not launch $url';
     }
   }

   _sendingWhatsappMessage() async {
     var url = Uri.parse("https://wa.me/$phoneNumber/?text=${Uri.parse(message)}");
     if (await canLaunchUrl(url)) {
       await launchUrl(url);
     } else {
       throw 'Could not launch $url';
     }
   }

   _sendingSms() async {
     var url = Uri.parse("sms:$phoneNumber?body=$message");
     if (await canLaunchUrl(url)) {
       await launchUrl(url);
     } else {
       throw 'Could not launch $url';
     }
   }

  @override
  Widget build(BuildContext context) {
     TrackingController trackingController = Get.find<TrackingController>();
    Color apCol = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child: MyAppBar(pageTitle: 'Acceuil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            const Text("Que souhaitez vous faire ?",textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic),),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.defaultDialog(title: "Contacter le livreur",titleStyle: TextStyle(color: apCol),content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      GestureDetector(
                        onTap : ()=> _makingPhoneCall(),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(Icons.call,size: 35,color: Colors.blue,),
                        ),
                      ),

                      GestureDetector(
                        onTap : ()=> _sendingWhatsappMessage(),
                        child: const Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Icon(Icons.whatsapp,size: 35,color: Colors.green,),
                        ),
                      ),
                        GestureDetector(
                          onTap : ()=> _sendingSms(),
                          child: const Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Icon(Icons.sms,size: 35,color: Colors.blueGrey,),
                          ),
                        )
                      ],
                    ));
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
                          const Text('Commander une livraison',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(),
                              Image.asset("assets/images/moto.png"),
                              Image.asset("assets/images/auto.png"),
                              const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>{
                    trackingController.initializeTrackingController(),
                    Get.to(()=>ClientHome())
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
                          const Text('Suivre mon colis',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          Image.asset("assets/images/coli.png"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
