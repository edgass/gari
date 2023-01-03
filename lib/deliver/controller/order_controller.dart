

import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../models/order_model.dart';
import '../../utils/strings.dart';
import 'package:http/http.dart' as http;

enum CreateOrderEnum {
  INITIAL,
  CREATED,
  CREATING,
  FAILED,
  UNAUTHORIZED
}


enum FetchOrderEnum{
  LOADING,
  INITIAL,
  SUCCESS,
  ERROR,
  UNAUTHORIZED
}


class OrderController extends GetxController{


  CreateOrderEnum createOrderStatus = CreateOrderEnum.INITIAL;
  FetchOrderEnum fetchOrderStatus  = FetchOrderEnum.INITIAL;
  String clientName = "";
  String clientAdress = "";
  String deliverAdress = "";
  String destName = "";
  String destNum = "";

  OrderModel? currentOrder;
  String? idOrderToSearch;
  //final Rx<OrderModel> _order = Rx<OrderModel>(new OrderModel(created: true));
    //var orderTo = Rx<OrderModel>(OrderModel(created: false)).obs;

//  RxList<OrderModel> orderList = (List<OrderModel>.of([])).obs;

  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    fetchSingleOrder();
    super.onInit();
  }

  setIdOrderToSearch(String? orderId){
    idOrderToSearch = orderId;
    update();
  }

  setClientName(String cn){
    clientName = cn;
    update();
  }

  setClientAdress(String ca){
    clientAdress = ca;
    update();
  }

  setDeliverAdress(String da){
    deliverAdress = da;
    update();
  }

  setDestName(String dn){
    destName = dn;
    update();
  }

  setDestNum(String dn){
    destNum = dn;
    update();
  }




  setCreateOrderStatus(CreateOrderEnum state){
    createOrderStatus = state;
    update();
  }

  setFetchOrderStatus(FetchOrderEnum ft){
    fetchOrderStatus = ft;
    update();
  }

  initializeOrderListFetchingPage(){
    currentOrder =null;
  }


    Stream<OrderModel>? fetchSingleOrder() async*{
    print("test");
      OrderModel eventList;
      setFetchOrderStatus(FetchOrderEnum.LOADING);
      while(true){
        try{
          String? token = await _auth.currentUser?.getIdToken();
          print(currentOrder?.id);
          var response = await get(
              headers: {
                'Authorization': 'Bearer $token',
                'Content-Type': 'application/json',
              },
              Uri.parse("${Strings.URL}/order/$idOrderToSearch")

          );
          print("réponse ${response.body}");
//print(json.decode(response.body));
          eventList = singleOrderModelFromJson(response.body);


          update();
          setFetchOrderStatus(FetchOrderEnum.SUCCESS);




        }catch(e){
          setFetchOrderStatus(FetchOrderEnum.ERROR);
          throw Exception("Erreur de fetch "+e.toString());
        }
        await Future.delayed(Duration(seconds: 5));
        yield eventList;
      }
    }

  Future<OrderModel>? fetchSingleOrderResponse() async{
    print("test");
    OrderModel eventList;
    setFetchOrderStatus(FetchOrderEnum.LOADING);
      try{
        String? token = await _auth.currentUser?.getIdToken();
        print(currentOrder?.id);
        var response = await get(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            Uri.parse("${Strings.URL}/order/GARI$idOrderToSearch")

        );
        print("réponse ${response.body}");
//print(json.decode(response.body));
        eventList = singleOrderModelFromJson(response.body);
        currentOrder = singleOrderModelFromJson(response.body);


        update();
        setFetchOrderStatus(FetchOrderEnum.SUCCESS);




      }catch(e){
        setFetchOrderStatus(FetchOrderEnum.ERROR);
        throw Exception("Erreur de fetch "+e.toString());
      }
      await Future.delayed(Duration(seconds: 5));
      return eventList;
  }




  Future<dynamic> createOrder() async{
    setCreateOrderStatus(CreateOrderEnum.CREATING);


    try{
      String? token = await _auth.currentUser?.getIdToken();
      var response = await http.post(

          Uri.parse(Strings.URL+"/order"),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'clientName': clientName,
            'clientAddress': clientAdress,
            'recipientAddress': deliverAdress,
            'recipientname': destName,
            'recipientNumber': destNum,
          }
          )
      );
      if(response.statusCode == 201){
        setCreateOrderStatus(CreateOrderEnum.CREATED);
        currentOrder = singleOrderModelFromJson(response.body);
        setIdOrderToSearch(currentOrder?.id);
        print("Created order is"+currentOrder.toString());
        print("Event is created succesfully "+response.body);
        return response.body;
      }else if(response.statusCode == 401){
        setCreateOrderStatus(CreateOrderEnum.UNAUTHORIZED);
        print("Event creation : No authorisation "+response.body);
      }
      else{
        setCreateOrderStatus(CreateOrderEnum.FAILED);
        print("Event creation failed "+response.body);
      }

    }catch(e){
      setCreateOrderStatus(CreateOrderEnum.FAILED);
      print("Event  creation failed ");
      print(e);
      throw e;
    }
  }

  Future<dynamic> changeOrderStatus(String status) async{
    setCreateOrderStatus(CreateOrderEnum.CREATING);


    try{
      String? token = await _auth.currentUser?.getIdToken();
      var response = await http.put(

          Uri.parse(Strings.URL+"/order/${currentOrder?.id}/status?status=$status"),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'status': status
          }
          )
      );
      if(response.statusCode == 201){
        setCreateOrderStatus(CreateOrderEnum.CREATED);
        currentOrder = singleOrderModelFromJson(response.body);
        print("Created order is"+currentOrder.toString());
        print("Event is created succesfully "+response.body);
        return response.body;
      }else if(response.statusCode == 401){
        setCreateOrderStatus(CreateOrderEnum.UNAUTHORIZED);
        print("Event creation : No authorisation "+response.body);
      }else if(response.statusCode == 500){
        setCreateOrderStatus(CreateOrderEnum.FAILED);
      }
      else{
        setCreateOrderStatus(CreateOrderEnum.FAILED);
        print("Event creation failed "+response.body);
      }

    }catch(e){
      setCreateOrderStatus(CreateOrderEnum.FAILED);
      print("Event  creation failed ");
      print(e);
      throw e;
    }
  }

/*  fetchOrderList(String orderId) async{
    try{
      String? token = await _auth.currentUser?.getIdToken();
      print(createdOrder?.id);
      var response = await get(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
          Uri.parse("${Strings.URL}/order")

      );
      print("réponse ${response.body}");
//print(json.decode(response.body));
      setFetchOrderStatus(FetchOrderEnum.SUCCESS);
      List<OrderModel> listOrder =  orderModelFromJson(response.body);

      if(listOrder.isNotEmpty){
        for(var i=0;i<listOrder.length;i++){
          if(listOrder[i].id!.contains(orderId)){
            orderList.value.add(listOrder[i]);
          }
        }
      }else{
        orderList.value = [];
      }
    }catch(e){
      setFetchOrderStatus(FetchOrderEnum.ERROR);
      throw Exception("Erreur de fetch "+e.toString());
    }
  }*/


}