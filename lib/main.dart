
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gari/utils/binding.dart';
import 'package:get/get.dart';

import 'auth/_auth.dart';
import 'auth/controller/auth_controller.dart';
import 'home_page.dart';
void main() async{
/*  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);*/
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HomeBinding().dependencies();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0x70bccc),
      statusBarBrightness: Brightness.light

    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor:  const Color(0xFF70bccc),
            brightness: Brightness.light,
            primary:  const Color(0xFF70bccc),
            secondary: Colors.amber),
        useMaterial3: true,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
       // primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF70bccc),
      ),
      //home:  ClientHome(),
   //   home:  DeliverHome(),
      home:  StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context,AsyncSnapshot<User?> snapshot){
       //   return snapshot.data == null ? const Auth() : _auth.currentUser?.phoneNumber =="" ? ClientDashboard() : HomePage();
         // return snapshot.data == null ? const Auth() : HomePage();

          return snapshot.data == null ? const Auth() : const HomePage();
        //  return  DeliverHome();
        },
      ),
    );
  }
}
