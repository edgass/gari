import 'package:firebase_auth/firebase_auth.dart';
import 'package:gari/deliver/controller/order_controller.dart';
import 'package:gari/models/tracking_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../models/tracking_model.dart';
import '../utils/strings.dart';
enum FetchTrackingEnum{
  LOADING,
  INITIAL,
  SUCCESS,
  ERROR,
  UNAUTHORIZED
}
enum FetchTrackingEnumStream{
  LOADING,
  INITIAL,
  SUCCESS,
  ERROR,
  UNAUTHORIZED
}

class TrackingController extends GetxController{

  final _auth = FirebaseAuth.instance;
  FetchTrackingEnum fetchTrackingStatus  = FetchTrackingEnum.INITIAL;
  FetchTrackingEnumStream fetchTrackingStreamStatus  = FetchTrackingEnumStream.INITIAL;

  //List<TrackingModel>? listEtape ;

  //For simple returning order etape, this is just for select order tracking
  List<TrackingModel>? orderListEtape;

  //For Stream, for real time updating
  List<TrackingModel> listEtape = <TrackingModel>[].obs;

  String? idOrderToTrack ;

  setIdOrderToTrack(String id){
    idOrderToTrack = id;
    update();
  }

  setFetchTrackingStatus(FetchTrackingEnum ft){
    fetchTrackingStatus = ft;
    update();
  }

  setFetchTrackingStreamStatus(FetchTrackingEnumStream ft){
    fetchTrackingStreamStatus = ft;
    update();
  }

  initializeTrackingController(){
    orderListEtape = null;
    fetchTrackingStatus = FetchTrackingEnum.INITIAL;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }

  Stream<List<TrackingModel>>? fetchTrackingListStream() async*{
    List<TrackingModel> trackingModelList;

while(true){
  try{
 //   setFetchTrackingStreamStatus(FetchTrackingEnumStream.LOADING);
    String? token = await _auth.currentUser?.getIdToken();
    print("$idOrderToTrack jvbzekvbzvbzkjvbzjevbjzvbkzevbkjzevbjkzebvzekvbzekjvbzekjvbvb");
    var response = await get(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        Uri.parse("${Strings.URL}/tracking/order/$idOrderToTrack")

    );

//print(json.decode(response.body));
 //   setFetchTrackingStreamStatus(FetchTrackingEnumStream.SUCCESS);
    trackingModelList  = trackingModelFromJson(response.body);
    print("réponse $trackingModelList");

  }catch(e){
  //  setFetchTrackingStreamStatus(FetchTrackingEnumStream.ERROR);
    throw Exception("Erreur de fetch "+e.toString());
  }
  await Future.delayed(Duration(seconds: 5));
  yield trackingModelList;
}
  }



  fetchTrackingListOnce(String orderId) async{
      try{
        setFetchTrackingStatus(FetchTrackingEnum.LOADING);
        String? token = await _auth.currentUser?.getIdToken();
        var response = await get(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            Uri.parse("${Strings.URL}/tracking/order/$idOrderToTrack")

        );
        print("réponse ${response.body}");
//print(json.decode(response.body));
        setFetchTrackingStatus(FetchTrackingEnum.SUCCESS);

        orderListEtape  = trackingModelFromJson(response.body);
        fetchTrackingListStream;

      }catch(e){
        setFetchTrackingStatus(FetchTrackingEnum.ERROR);
        throw Exception("Erreur de fetch "+e.toString());
      }

  }
}