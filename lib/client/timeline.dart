import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
class Timeline extends StatelessWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appCol = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(top: 18.0,right: 10),
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                hintText: 'Rechercher votre colis (N° colis)',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

          ),
          Column(
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
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                        //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                afterLineStyle: LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Theme.of(context).primaryColor,
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
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                        //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                afterLineStyle: LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Theme.of(context).primaryColor,
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
                          color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                afterLineStyle: LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Theme.of(context).primaryColor,
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
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                        //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                afterLineStyle: LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Theme.of(context).primaryColor,
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
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                        //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: appCol
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                afterLineStyle: LineStyle(
                    color: Theme.of(context).primaryColor
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Theme.of(context).primaryColor,
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
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                        //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Colors.transparent
                ),
                afterLineStyle: LineStyle(
                    color:  Colors.transparent
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Colors.grey.withOpacity(0.2),
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
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                        //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Colors.transparent
                ),
                afterLineStyle: LineStyle(
                    color:  Colors.transparent
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Colors.grey.withOpacity(0.2),
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
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                        //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Colors.transparent
                ),
                afterLineStyle: LineStyle(
                    color:  Colors.transparent
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Colors.grey.withOpacity(0.2),
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
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                        //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Colors.transparent
                ),
                afterLineStyle: LineStyle(
                    color:  Colors.transparent
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Colors.grey.withOpacity(0.2),
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
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.2,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12/08/2022",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                        //  color: Colors.grey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.15,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12:56",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 10),),
                        ) ,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.withOpacity(0.2)
                        ),
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("En route pour enlevement",style: TextStyle(color: Colors.white,fontSize: 10),),
                        ),
                      )
                    ],
                  ),
                ),
                beforeLineStyle:  LineStyle(
                    color: Colors.transparent
                ),
                afterLineStyle: LineStyle(
                    color:  Colors.transparent
                ),
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  color: Colors.transparent,
                  iconStyle: IconStyle(
                    color: Colors.grey.withOpacity(0.2),
                    iconData: Icons.gps_fixed_sharp,
                  ),
                ),

              ),


            ],
          )
        ],
      ),
    );
  }
}
