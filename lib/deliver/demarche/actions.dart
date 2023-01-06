import 'package:flutter/material.dart';
import 'package:gari/deliver/controller/order_controller.dart';
import 'package:gari/models/order_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ColisActions extends StatelessWidget {
  const ColisActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    OrderController orderController = Get.find<OrderController>();

    return SingleChildScrollView(
      child: StreamBuilder<OrderModel>(
        stream: orderController.fetchSingleOrder(),
        builder:(
            BuildContext context,
            AsyncSnapshot<OrderModel> snapshot,
        ) {
          if(snapshot.hasData && snapshot.data?.failure != true){
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<OrderController>(
                      builder:(value)=> value.createOrderStatus == CreateOrderEnum.CREATING ? Text("Patientez SVP...") : Text("")),
                ),
                Padding(
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
                        backgroundColor: MaterialStateColor.resolveWith((states) =>snapshot.data?.collect == true ? Colors.grey : apCol),
                      ),//  foreground
                      onPressed: () {
                        if( snapshot.data?.collect == true){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Cette étape est déja achevée"),
                            backgroundColor: Colors.lightBlueAccent,
                          ));
                        }else{
                          orderController.changeOrderStatus("PICKED_UP");
                        }
                      },
                      child:  Text('Collecte',style: TextStyle(color: snapshot.data?.collect == true ? Colors.white70 : Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                Padding(
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
                        backgroundColor: MaterialStateColor.resolveWith((states) => snapshot.data?.departure == true ? Colors.grey : apCol),
                      ),//  foreground
                      onPressed: () {
                        if( snapshot.data?.departure == true){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Cette étape est déja achevée"),
                            backgroundColor: apCol,
                          ));
                        }else{
                          orderController.changeOrderStatus("ON_WAY");
                        }
                      },
                      child: Text('Départ',style: TextStyle(color: snapshot.data?.departure == true ? Colors.white70 :Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                Padding(
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
                        backgroundColor: MaterialStateColor.resolveWith((states) =>snapshot.data?.arrived == true ? Colors.grey : apCol),
                      ),//  foreground
                      onPressed: () {
                        if( snapshot.data?.arrived == true){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Cette étape est déja achevée"),
                            backgroundColor: Colors.lightBlueAccent,
                          ));
                        }else{
                          orderController.changeOrderStatus("ARRIVED");
                        }
                      },
                      child: Text('Arrivée',style: TextStyle(color:snapshot.data?.arrived == true ? Colors.white70 : Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                Padding(
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
                        backgroundColor: MaterialStateColor.resolveWith((states) => snapshot.data?.handedOver == true ? Colors.grey : apCol),
                      ),//  foreground
                      onPressed: () {
                        if( snapshot.data?.handedOver == true){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Cette étape est déja achevée"),
                            backgroundColor: Colors.lightBlueAccent,
                          ));
                        }else{
                          orderController.changeOrderStatus("DROP_OUT");
                        }
                      },
                      child: Text('Remise du colis',style: TextStyle(color: snapshot.data?.handedOver == true ? Colors.white70 : Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                Padding(
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
                        backgroundColor: MaterialStateColor.resolveWith((states) => snapshot.data?.complete == true ? Colors.grey : apCol),
                      ),//  foreground
                      onPressed: () {
                       if( snapshot.data?.complete == true){
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text("Cette étape est déja achevée"),
                           backgroundColor: Colors.lightBlueAccent,
                         ));
                       }else{
                         orderController.changeOrderStatus("VALIDATED");
                       }
                      },
                      child: Text('Livraison complète',style: TextStyle(color: snapshot.data?.complete == true ? Colors.white70 : Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            );
          }else{
            return snapshot.data?.failure == true ?
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Livraison échouée",style: TextStyle(color: Colors.red,fontSize: 35),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Veuillez apeller le client dés que possible",style: TextStyle(fontSize: 13),),
                  ),
                ],
              ),
            ):
            Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  CircularProgressIndicator(color: apCol,),
                  SizedBox(height: 20,),
                  Text("Chargement du statut de votre colis")
                ],
              ),
            );
          }

        },
      ),
    );
  }
}
