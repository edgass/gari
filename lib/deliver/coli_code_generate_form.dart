import 'package:flutter/material.dart';
import 'package:gari/auth/_auth.dart';
import 'package:gari/auth/controller/auth_controller.dart';
import 'package:gari/deliver/controller/order_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ColiCodeGenerateForm extends StatelessWidget {
  const ColiCodeGenerateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    OrderController orderController = Get.find<OrderController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text("Client",style: TextStyle(color: apCol,fontSize: 16,fontWeight: FontWeight.bold),),
        ),
        const SizedBox(height: 5,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            onChanged: (value){
              orderController.setClientName(value);
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              filled: true,
              hintText: 'Nom du Client',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            onChanged: (value){
              orderController.setClientAdress(value);
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              filled: true,
              hintText: 'Adresse du Client',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        ),


        const SizedBox(height: 15,),


        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text("Point de livraison",style: TextStyle(color: apCol,fontSize: 16,fontWeight: FontWeight.bold),),
        ),
        const SizedBox(height: 5,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            onChanged: (value){
              orderController.setDeliverAdress(value);
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              filled: true,
              hintText: 'Adresse de livraison',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            onChanged: (value){
              orderController.setDestName(value);
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              filled: true,
              hintText: 'Nom du destinataire',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            onChanged: (value){
              orderController.setDestNum(value);
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: true,
            //  prefix: Text("+221",style: TextStyle(color: apCol),),
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),

              hintText: 'Numéro du destinataire',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,

              ),
            ),
          ),


        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                      )
                  ),
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black45),
                ),// foreground
                onPressed: () {
                  orderController.createOrder().then((value) => print(value));
                },
                child: GetBuilder<OrderController> (
                 // initState: orderController(),
                  builder: (value)=>value.createOrderStatus == CreateOrderEnum.CREATING ? const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: CircularProgressIndicator(),
                  )  : const Text('Générer un code de suivi colis',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
