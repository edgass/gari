import 'package:flutter/material.dart';
import 'package:gari/appBar.dart';
import 'package:gari/client/timeline.dart';
class ClientHome extends StatelessWidget {
   ClientHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: MyAppBar(pageTitle: 'Suivi colis'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0,left: 10,right: 10),
        child: Center(
          child: Timeline()
        ),
      ),
    );
  }
}
