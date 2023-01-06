import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class contactDialog{




  openContactDialog(BuildContext context,String dialogTitle,String phoneNumber,String message){

    _makingPhoneCall() async {
      var url = Uri.parse("tel:$phoneNumber");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _sendingWhatsappMessage(BuildContext context) async{
      FlutterOpenWhatsapp.sendSingleMessage(phoneNumber, message);
/*
     var url = Uri.parse("https://wa.me/$phoneNumber/?text=${Uri.parse(message)}");
     if (await canLaunchUrl(url)) {
       await launchUrl(url);
     } else {
       throw 'Could not launch $url';
     }*/

/*     final val = await WhatsappShare.isInstalled();
     if(val == true){
       await WhatsappShare.share(
         phone: '772477730',
         text: message,
         linkUrl: 'https://flutter.dev/',

       );
     }else{
      print("whatspap no installed in this device");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Whatsapp n'est pas installé sur votre téléphone. "))

      );
     }*/

    }

    _sendingSms() async {
      var url = Uri.parse("sms:$phoneNumber?body=$message");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Color apCol = Theme.of(context).primaryColor;

    Get.defaultDialog(title: dialogTitle,titleStyle: TextStyle(color: apCol),content: Row(

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
          onTap : ()=> _sendingWhatsappMessage(context),
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
  }
}