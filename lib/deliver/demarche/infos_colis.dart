import 'package:flutter/material.dart';
import 'package:gari/models/order_model.dart';
class InfoColis extends StatelessWidget {
  OrderModel? orderModel ;
   InfoColis({Key? key,required this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    return Column(
      children: [
        Text("Info Client :",style: TextStyle(color: apCol,fontSize: 15,fontWeight: FontWeight.bold),),
        Text(orderModel?.clientName ?? "",style: TextStyle(fontSize: 10)),
        Text(orderModel?.clientAddress ?? "",style: TextStyle(fontSize: 10)),
        Text("77 564 84 10",style: TextStyle(color: Colors.blue,fontSize: 10,fontWeight: FontWeight.bold)),


        SizedBox(height: 10,),


        Text("Destination :",style: TextStyle(color: apCol,fontSize: 15,fontWeight: FontWeight.bold),),
        Text(orderModel?.recipientAddress ?? "",style: TextStyle(fontSize: 10)),
        Text("Camus Rufisque",style: TextStyle(fontSize: 10)),
        Text("Nafyssatou Gnane",style: TextStyle(fontSize: 10)),
        Text(orderModel?.recipientNumber ?? "",style: TextStyle(color: Colors.blue,fontSize: 10,fontWeight: FontWeight.bold)),

        SizedBox(height: 10,),


        Text(orderModel?.id ?? "",style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),)
      ],
    );
  }
}
