import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gari/client/client_dashboard.dart';

import 'admin/admin_home.dart';
import 'deliver/deliver_dashboard.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  int pageToRender = 0;
  @override
  void initState() {
    _auth.currentUser?.getIdToken().then((value) => print(value));
    final docUser = FirebaseFirestore.instance.collection('users').doc(_auth.currentUser?.uid);
    docUser.get().then((value) => {
    if(value.exists){
      if(value['role'] == 'deliver'){
        setState(() {
          pageToRender = 2;
        })
      }else if(value['role'] == 'admin'){
        setState(() {
          pageToRender = 3;
        })
      }else{
        setState(() {
          pageToRender = 1;
        })
      }
    }else{
    setState(() {
    pageToRender = 1;
    })
    }
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return pageToRender == 0 ? const Scaffold(
        body: Center(child: CircularProgressIndicator(color:  Color(0xFF70bccc),),)) :
    pageToRender == 2 ? const DeliverDashboard() :
    pageToRender == 3 ? const AdminHome() :  ClientDashboard();
  }
}
