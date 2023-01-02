

import 'dart:convert';

import 'package:get/get.dart';

enum CreateOrderEnum {
  INITIAL,
  CREATED,
  CREATING,
  FAILED,
  UNAUTHORIZED
}

class CreateEventController extends GetxController{


  String zone = "";
  String zoneId = "";
  String zipCode = "";
  double? latitude ;
  double? longitude;
  //User? user;
  DateTime? eventDate;
  String nomEvent = "";
  String nomLieuxEvent = "";
  String lieux = "";
  String description = "";
  String organiser = "";
  CreateOrderEnum createOrderstatus =  CreateOrderEnum.INITIAL;


  setCreateOrderStatus(CreateOrderEnum state){
    createOrderstatus = state;
    update();
  }


  Future<dynamic> createOrder() async{
    setCreateOrderStatus(CreateOrderEnum.INITIAL);

    try{
      var response = await http.post(
          Uri.parse(Strings.URL+"event"),
          headers: {
            //'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'name': nomEvent,
            'date': eventDate?.toIso8601String(),
            'adress': zone,
            'latitude': latitude,
            'longitude': longitude,
            'organiser': organiser,
            'description': description,
            'lieux': lieux,
            'category': category?.id,
            'user': 1,
            'imageUrl':imgUrl
          }
          )
      );
      if(response.statusCode == 201){
        setCreateEventStatus(CreateEventEnum.CREATED);
        print("Event is created succesfully "+response.body);
      }else if(response.statusCode == 401){
        setCreateEventStatus(CreateEventEnum.UNAUTHORIZED);
        print("Event  creation : No authorisation "+response.body);
      }
      else{
        setCreateEventStatus(CreateEventEnum.FAILED);
        print("Event  creation failed "+response.body);
      }

    }catch(e){
      setCreateEventStatus(CreateEventEnum.FAILED);
      print("Event  creation failed ");
      print(e);
      throw e;
    }
  }

  Future<dynamic> createEventWithFile() async{
    uploadFile().then((value){
      createEvent(value);
    });
  }



  Future<List<CategoryModel>> fetchCategory(String categoryToSearch) async {

    List<CategoryModel>? categorys = [];

    try{
      final response = await http.get(Uri.parse(Strings.URL+"category"));

      if (response.statusCode == 200) {

        List<CategoryModel> categoryList =  categoryModelListFromJson(response.body);
        print(categoryList);
        for(int i=0;i<categoryList.length;i++){

          if(categoryList[i].name.toLowerCase().contains(categoryToSearch.toLowerCase())){
            categorys.add(categoryList[i]);
          }
        }
      } else {
        throw Exception('Failed to fetch Categorys');
      }

      return categorys;

    }catch(e){
      throw Exception(e);
    }
  }
}