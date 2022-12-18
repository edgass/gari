import 'package:flutter/material.dart';
class ColiCodeGenerateForm extends StatelessWidget {
  const ColiCodeGenerateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color apCol = Theme.of(context).primaryColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text("Client",style: TextStyle(color: apCol,fontSize: 16,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 5,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              filled: true,
              hintText: 'Nom du Client',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              filled: true,
              hintText: 'Adresse du Client',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        ),


        SizedBox(height: 15,),


        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text("Point de livraison",style: TextStyle(color: apCol,fontSize: 16,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 5,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              filled: true,
              hintText: 'Adresse de livraison',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              filled: true,
              hintText: 'Nom du destinataire',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(

            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: true,
              prefix: Text("+221",style: TextStyle(color: apCol),),
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),

              hintText: 'Numéro du destinataire',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,

              ),
            ),
          ),


        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.black54),
                ),// foreground
                onPressed: () { },
                child: Text('Générer un code de suivi colis',style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
