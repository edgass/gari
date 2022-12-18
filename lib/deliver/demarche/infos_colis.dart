import 'package:flutter/material.dart';
class InfoColis extends StatelessWidget {
  const InfoColis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    return Column(
      children: [
        Text("Info Client :",style: TextStyle(color: apCol,fontSize: 15,fontWeight: FontWeight.bold),),
        Text("Yadali Sarr",style: TextStyle(fontSize: 10)),
        Text("54 Rue Khalid Dakar",style: TextStyle(fontSize: 10)),
        Text("77 564 84 10",style: TextStyle(color: Colors.blue,fontSize: 10,fontWeight: FontWeight.bold)),


        SizedBox(height: 10,),


        Text("Destination :",style: TextStyle(color: apCol,fontSize: 15,fontWeight: FontWeight.bold),),
        Text("Resto Fallou Mbacké: 78 rue Albert",style: TextStyle(fontSize: 10)),
        Text("Camus Rufisque",style: TextStyle(fontSize: 10)),
        Text("Nafyssatou Gnane",style: TextStyle(fontSize: 10)),
        Text("77 823 24 12",style: TextStyle(color: Colors.blue,fontSize: 10,fontWeight: FontWeight.bold)),

        SizedBox(height: 10,),


        Text("GARI45",style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),)
      ],
    );
  }
}
