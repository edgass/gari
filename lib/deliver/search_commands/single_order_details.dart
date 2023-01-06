import 'package:flutter/material.dart';
import 'package:gari/deliver/controller/order_controller.dart';
import 'package:gari/deliver/deliver_home.dart';
import 'package:gari/deliver/demarche/_demarche_coli.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../demarche/infos_colis.dart';
class SingleOrderDetail extends StatelessWidget {
  const SingleOrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    OrderController orderController = Get.find<OrderController>();
    return Column(
      children: [
        const Text("Votre colis a été retrouvé",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        InfoColis(orderModel: orderController.currentOrder ,),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            height: 50,
            child: ElevatedButton(// foreground
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      )
                  ),
                  backgroundColor: MaterialStateColor.resolveWith((states) => apCol),

                ),
                onLongPress: null,
                onPressed:() {
                  orderController.setIdOrderToSearch(orderController.currentOrder?.id);
                  Get.to(()=>DemarcheColi(order: orderController.currentOrder));
                },
                child: const Text('Continuer',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),) ,
              ),

          ),
        ),
      ],
    );
  }
}
