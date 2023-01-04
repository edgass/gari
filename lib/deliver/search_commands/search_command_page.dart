import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gari/deliver/controller/order_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../appBar.dart';
import 'command_list.dart';
class SearchCommandPage extends StatelessWidget {
  const SearchCommandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find<OrderController>();
    Color apCol = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: MyAppBar(pageTitle: "Rechercher colis"),
      ),
      body: GetBuilder<OrderController>(
        builder:(value)=> SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    prefixText: 'GARI',
                    hintText: 'Code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(23),
                      borderSide: BorderSide.none,
                    ),

                  ),
                  onChanged: (_value){
                    value.setIdOrderToSearch(_value);
                  },
                ),
              ),
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
                      onPressed:(){
                        FocusManager.instance.primaryFocus?.unfocus();
                        value.initializeOrderController();
                        value.fetchSingleOrderResponse();
                      },
                      child: value.fetchOrderStatus == FetchOrderEnum.LOADING ? CircularProgressIndicator(color: Colors.white,) : const Text('Rechercher le colis',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),) ,
                    ),
                ),
              ),
              SizedBox(height: 40,),
              CommandList()
            ],
          ),
        ),
      ),
    );
  }
}
