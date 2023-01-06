import 'package:flutter/material.dart';
import 'package:gari/appBar.dart';
import 'package:gari/deliver/controller/order_controller.dart';
import 'package:gari/deliver/demarche/actions.dart';
import 'package:gari/deliver/demarche/colis_echec_confirmation.dart';
import 'package:gari/deliver/demarche/infos_colis.dart';
import 'package:gari/models/order_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class DemarcheColi extends StatelessWidget {
  OrderModel? order;
  DemarcheColi({Key? key,required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find<OrderController>();
    Color apCol = Theme.of(context).primaryColor;
    return Scaffold(
        resizeToAvoidBottomInset:false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: MyAppBar(pageTitle: 'Aller chez le client'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0,bottom: 18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoColis(orderModel: orderController.currentOrder,),
              Expanded(child: ColisActions()),
              GetBuilder<OrderController>(
                builder:(value)=> value.currentOrder?.failure == false ? Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)
                            )
                        ),
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                      ),//  foreground
                      onPressed: () => Get.defaultDialog(
                        title: 'Motif',
                        titleStyle: TextStyle(color: apCol,fontWeight: FontWeight.bold),
                        content: ColisEchecConfirmation(),

                      ),
                      child: Text('Livraison échouée',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ) : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
