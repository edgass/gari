import 'package:flutter/material.dart';
import 'package:gari/deliver/controller/order_controller.dart';
import 'package:gari/deliver/demarche/_demarche_coli.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../appBar.dart';
import 'coli_code_generate_form.dart';
class DeliverHome extends StatelessWidget {
  const DeliverHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find<OrderController>();
    Color apCol = Theme.of(context).primaryColor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: MyAppBar(pageTitle: 'Demarrer la livraison'),
      ),
      body: Form(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColiCodeGenerateForm(),
                Expanded(child: Center(
                    child: GetBuilder<OrderController>(
                  builder:(value)=> value.currentOrder != null ?
                  Text(value.currentOrder?.id ?? "",textAlign:TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),) :
                  Text("",textAlign:TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),)

                    ))),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)
                                )
                            ),
                            backgroundColor: MaterialStateColor.resolveWith((states) => apCol),
                          ),// foreground
                          onPressed: () { Get.to(()=>DemarcheColi(order: orderController.currentOrder,));},
                          child: Text('GO',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                      ),

                    ),
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width*0.5,
                      color: Colors.black54,
                    )
                  ],
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
