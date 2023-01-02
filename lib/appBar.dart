import 'package:flutter/material.dart';
import 'package:gari/setting/_setting_home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class MyAppBar extends StatelessWidget {
  String pageTitle;
  bool? isHome = false;
   MyAppBar({Key? key,required this.pageTitle,this.isHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      leading: isHome == false ?
      GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back,color: Colors.white,))
          : null,
      actions: [Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: GestureDetector(
            onTap: ()=>Get.to(()=> SettingHome()),
            child: Icon(Icons.account_circle_outlined,color: Colors.white,)),
      )],
      centerTitle: true,
      title : Image.asset('assets/images/gariLogo.png',width: 75),
      backgroundColor: const Color(0xFF70bccc),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(45.0),
        child:  Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
            ),
            height: 40,
            child: Text(pageTitle,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),),
      //  title: Text("Test") ,
    );
  }
}
