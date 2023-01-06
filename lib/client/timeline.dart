import 'package:flutter/material.dart';
import 'package:gari/client/timeline_body.dart';
import 'package:gari/client/tracking_controller.dart';
import 'package:gari/deliver/controller/order_controller.dart';
import 'package:get/get.dart';
class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrackingController trackingController = Get.find<TrackingController>();
    final TextEditingController _codeController = TextEditingController();
    Color appCol = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(top: 18.0,right: 10),
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextField(
              controller: _codeController,
       /*       onChanged: (value){
                trackingController.setIdOrderToTrack("GARI$value");
              },*/
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                prefixText: 'GARI',
                hintText: 'Rechercher votre colis (N° colis)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

          ),
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.7,
                height: 50,
                child: GetBuilder<TrackingController>(
                  builder:(value)=> ElevatedButton(// foreground
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                          )
                      ),
                      backgroundColor: MaterialStateColor.resolveWith((states) => appCol),

                    ),
                    onLongPress: null,
                    onPressed:(){
                      print(_codeController.text);
                      FocusManager.instance.primaryFocus?.unfocus();
                     value.initializeTrackingController();
                     value.setIdOrderToTrack("GARI${_codeController.text}");
                      value.fetchTrackingListOnce(trackingController.idOrderToTrack ?? "");
                    },
                    child: value.fetchTrackingStatus == FetchTrackingEnum.LOADING ? const CircularProgressIndicator(color: Colors.white,) : const Text('Rechercher le colis',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),) ,
                  ),
                ),
              ),
            ),
      //   TimelineBody()
          GetBuilder<TrackingController>(
              builder: (value)=> value.fetchTrackingStatus == FetchTrackingEnum.LOADING ? const Padding(
                padding: EdgeInsets.all(30.0),
                child: Center(child: Text("Patientez SVP...")),
              ) :
                  value.orderListEtape != null ? TimelineBody() : const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Center(child: Text("Entrer le code du colis"),),
                  )
          )

        ],
      ),
    );
  }
}
