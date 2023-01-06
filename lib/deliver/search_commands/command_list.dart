import 'package:flutter/material.dart';
import 'package:gari/deliver/controller/order_controller.dart';
import 'package:gari/deliver/search_commands/single_order_details.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class CommandList extends StatelessWidget {
  const CommandList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find<OrderController>();
    return GetBuilder<OrderController>(
        builder:(value)=> value.fetchOrderStatus == FetchOrderEnum.LOADING ?
           const Text("Patientez SVP..."):
          orderController.currentOrder != null ?
           const SingleOrderDetail() : const Center(child : Text("Entrez un code valide pour retrouver votre colis"))
    );
  }
}
