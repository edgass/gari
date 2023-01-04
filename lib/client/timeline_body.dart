import 'package:flutter/material.dart';
import 'package:gari/client/tracking_controller.dart';
import 'package:gari/models/tracking_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timeline_tile/timeline_tile.dart';
class TimelineBody extends StatelessWidget {
   TimelineBody({Key? key}) : super(key: key);
  TrackingController trackingController = Get.find<TrackingController>();
  @override
  Widget build(BuildContext context) {

    Color apCol = Theme.of(context).primaryColor;
    Color appCol = Theme.of(context).primaryColor;
    return StreamBuilder<List<TrackingModel>>(
      stream: trackingController.fetchTrackingListStream() ,
      builder:(
          BuildContext context,
          AsyncSnapshot<List<TrackingModel>> snapshot,
      ) {
        if(snapshot.hasData){
        return Column(
           children: [
             TimelineTile(
               isFirst: true,
               alignment: TimelineAlign.manual,
               lineXY: 0.1,
               endChild: Container(
                 constraints: const BoxConstraints(
                   minHeight: 20,
                   maxHeight: 60,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'PICKED_UP') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.2,
                       child:Padding(
                         padding: const EdgeInsets.all(8.0),
                         child:
                         Text(snapshot.data?.firstWhereOrNull((element) => element.type == 'PICKED_UP') != null ? "${snapshot.data![0].createdAt.day}/${snapshot.data![0].createdAt.month}/${snapshot.data![0].createdAt.year}" : "--/--/---",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                       ) ,
                       //  color: Colors.grey,
                     ),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'PICKED_UP') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.15,
                       child: Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Text(snapshot.data?.firstWhereOrNull((element) => element.type == 'PICKED_UP') != null ? "${snapshot.data![0].createdAt.hour}:${snapshot.data![0].createdAt.minute}" : "--:--",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                       ) ,
                     ),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'PICKED_UP') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.4,
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("Collecte du colis",style: TextStyle(color: Colors.white,fontSize: 10),),
                       ),
                     )
                   ],
                 ),
               ),
               beforeLineStyle:  LineStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'PICKED_UP') != null ? appCol : Colors.grey.withOpacity(0.2)
               ),
               afterLineStyle: LineStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'PICKED_UP') != null ? appCol : Colors.grey.withOpacity(0.2)
               ),
               indicatorStyle: IndicatorStyle(
                 width: 40,
                 color: Colors.transparent,
                 iconStyle: IconStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'PICKED_UP') != null ? appCol : Colors.grey.withOpacity(0.2),
                   iconData: Icons.gps_fixed_sharp,
                 ),
               ),

             ),
             TimelineTile(
               alignment: TimelineAlign.manual,
               lineXY: 0.1,
               endChild: Container(
                 constraints: const BoxConstraints(
                   minHeight: 20,
                   maxHeight: 60,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ON_WAY') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.2,
                       child:Padding(
                         padding: const EdgeInsets.all(8.0),
                         child:
                         Text(snapshot.data?.firstWhereOrNull((element) => element.type == 'ON_WAY') != null ? "${snapshot.data![1].createdAt.day}/${snapshot.data![1].createdAt.month}/${snapshot.data![1].createdAt.year}" : "--/--/---",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                       ) ,
                       //  color: Colors.grey,
                     ),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ON_WAY') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.15,
                       child: Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Text(snapshot.data?.firstWhereOrNull((element) => element.type == 'ON_WAY') != null ? "${snapshot.data![1].createdAt.hour}:${snapshot.data![1].createdAt.minute}" : "--:--",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                       ) ,
                     ),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ON_WAY') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.4,
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("En route pour livraison",style: TextStyle(color: Colors.white,fontSize: 10),),
                       ),
                     )
                   ],
                 ),
               ),
               beforeLineStyle:  LineStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ON_WAY') != null ? appCol : Colors.grey.withOpacity(0.2)
               ),
               afterLineStyle: LineStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ON_WAY') != null ? appCol : Colors.grey.withOpacity(0.2)
               ),
               indicatorStyle: IndicatorStyle(
                 width: 40,
                 color: Colors.transparent,
                 iconStyle: IconStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ON_WAY') != null ? appCol : Colors.grey.withOpacity(0.2),
                   iconData: Icons.gps_fixed_sharp,
                 ),
               ),

             ),
             TimelineTile(
               alignment: TimelineAlign.manual,
               lineXY: 0.1,
               endChild: Container(
                 constraints: const BoxConstraints(
                   minHeight: 20,
                   maxHeight: 60,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ARRIVED') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.2,
                       child:Padding(
                         padding: const EdgeInsets.all(8.0),
                         child:
                         Text(snapshot.data?.firstWhereOrNull((element) => element.type == 'ARRIVED') != null ? "${snapshot.data![2].createdAt.day}/${snapshot.data![2].createdAt.month}/${snapshot.data![2].createdAt.year}" : "--/--/---",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                       ) ,
                       //  color: Colors.grey,
                     ),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ARRIVED') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.15,
                       child: Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Text(snapshot.data?.firstWhereOrNull((element) => element.type == 'ARRIVED') != null ? "${snapshot.data![2].createdAt.hour}:${snapshot.data![2].createdAt.minute}" : "--:--",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                       ) ,
                     ),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ARRIVED') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.4,
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("Arrivé à destination",style: TextStyle(color: Colors.white,fontSize: 10),),
                       ),
                     )
                   ],
                 ),
               ),
               beforeLineStyle:  LineStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ARRIVED') != null ? appCol : Colors.grey.withOpacity(0.2)
               ),
               afterLineStyle: LineStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ARRIVED') != null ? appCol : Colors.grey.withOpacity(0.2)
               ),
               indicatorStyle: IndicatorStyle(
                 width: 40,
                 color: Colors.transparent,
                 iconStyle: IconStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'ARRIVED') != null ? appCol : Colors.grey.withOpacity(0.2),
                   iconData: Icons.gps_fixed_sharp,
                 ),
               ),

             ),
             TimelineTile(
               isLast: true,
               alignment: TimelineAlign.manual,
               lineXY: 0.1,
               endChild: Container(
                 constraints: const BoxConstraints(
                   minHeight: 20,
                   maxHeight: 60,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'DROP_OUT') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.2,
                       child:Padding(
                         padding: const EdgeInsets.all(8.0),
                         child:
                         Text(snapshot.data?.firstWhereOrNull((element) => element.type == 'DROP_OUT') != null ? "${snapshot.data![3].createdAt.day}/${snapshot.data![3].createdAt.month}/${snapshot.data![3].createdAt.year}" : "--/--/---",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                       ) ,
                       //  color: Colors.grey,
                     ),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'DROP_OUT') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.15,
                       child: Padding(
                         padding: EdgeInsets.all(8.0),
                         child: Text(snapshot.data?.firstWhereOrNull((element) => element.type == 'DROP_OUT') != null ? "${snapshot.data![3].createdAt.hour}:${snapshot.data![3].createdAt.minute}" : "--:--",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                       ) ,
                     ),
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color:snapshot.data?.firstWhereOrNull((element) => element.type == 'DROP_OUT') != null ? appCol : Colors.grey.withOpacity(0.2)
                       ),
                       width: MediaQuery.of(context).size.width*0.4,
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("Livré",style: TextStyle(color: Colors.white,fontSize: 10),),
                       ),
                     )
                   ],
                 ),
               ),
               beforeLineStyle:  LineStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'DROP_OUT') != null ? appCol : Colors.grey.withOpacity(0.2)
               ),
               afterLineStyle: LineStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'DROP_OUT') != null ? appCol : Colors.grey.withOpacity(0.2)
               ),
               indicatorStyle: IndicatorStyle(
                 width: 40,
                 color: Colors.transparent,
                 iconStyle: IconStyle(
                   color:snapshot.data?.firstWhereOrNull((element) => element.type == 'DROP_OUT') != null ? appCol : Colors.grey.withOpacity(0.2),
                   iconData: Icons.gps_fixed_sharp,
                 ),
               ),

             ),



           ],
         );
       }else{
          return GetBuilder<TrackingController>(
            builder:(value)=>
            value.fetchTrackingStatus == FetchTrackingEnum.LOADING ? Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(child: CircularProgressIndicator(color: appCol,)),
            ) :
            value.orderListEtape == null ? Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(child: Text("Entrer le code du colis"),),
            ) :
            Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  CircularProgressIndicator(color: apCol,),
                  SizedBox(height: 20,),
                  Text("Chargement des informations du colis"),
                ],
              ),
            ),
          );
        }
  }
    );
  }
}
