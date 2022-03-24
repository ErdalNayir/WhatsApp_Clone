import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:whatsapp_clone/Models/Person.dart';

class Status extends StatelessWidget {
  final List<Person> persons;
  final dynamic tabKey;

  const Status({Key? key,required this.persons,required this.tabKey}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    String _url="https://nextflow.in.th/wp-content/uploads/Google-Flutter-logo-dark-gray-bg-cover.png";

    return  SafeArea(
      top:false,
      bottom: false,
      child: Scaffold(
        body: Builder(
            builder:
                (BuildContext context){
              return ListView(
                padding: const EdgeInsets.only(top: 5,left: 0),
                primary: false,
                key: PageStorageKey<dynamic>(tabKey),
                children: [
                      ListTile(
                        leading:CircleAvatar(backgroundImage: NetworkImage(_url),radius: 30,child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.1),
                                  child: Container(
                                    child: CircleAvatar(
                                      radius: 11,
                                      backgroundColor: Colors.teal.shade600,
                                      foregroundColor: Colors.white,
                                      child: const Center(child: Icon(Icons.add,color: Colors.white,)),
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),

                                  ),
                                ),
                              ),
                            ]
                        ),),
                        title:const Text("My status",
                          style:TextStyle(
                            fontSize:20,  ),),
                        subtitle:const Text("Tap to add status update"),
                        trailing:IconButton(
                          icon:Icon(Icons.qr_code,color: Colors.teal.shade600,),onPressed:(){showAlertDialog(context);} ,),
                        onTap: (){showAlertDialog(context);},
                      ),


                  Padding(child: Text("Recent updates",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),),
                    padding: const EdgeInsets.only(left: 18),),
                  Padding(child: createListTile("Eyyüp Durman","Yesterday, 8:17 PM",createCircleAvatar(_url,const Color(0xFF25D366)),context),
                    padding: const EdgeInsets.only(right:0),),
                  Padding(child: createListTile("Erdal Nayir","Today, 5:21 PM",createCircleAvatar(_url,const Color(0xFF25D366)),context),
                    padding: const EdgeInsets.only(right:0),),

                  Padding(child: Text("Viewed updates",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),),
                    padding: const EdgeInsets.only(left: 18,top: 12,bottom: 12),),

                  Padding(child: createListTile("Kenan İnan","Yesterday, 7:21 AM",createCircleAvatar(_url,Colors.grey.shade400),context),
                    padding: const EdgeInsets.only(right:0),),


                ]

                ,);
            }),
        floatingActionButton:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children:
          [
            Padding(child: FloatingActionButton(backgroundColor: Colors.grey.shade400,onPressed: (){showAlertDialog(context);},child: Icon(Icons.add,color: Colors.grey.shade800,),),padding: EdgeInsets.only(bottom: 20),),
            FloatingActionButton(backgroundColor: Colors.teal.shade600,onPressed: (){showAlertDialog(context);},child: const Icon(Icons.camera_alt_rounded,color: Colors.white)),
          ],

        )
      ),


    );
  }

  Container createCircleAvatar(String _url,Color color) {
    return Container(
      child: Container(
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.teal.shade600,
          foregroundColor: Colors.white,
          backgroundImage: NetworkImage(_url),),
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle),
      ),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle),
      );


  }
}

showAlertDialog(BuildContext context){
  return CoolAlert.show(
    context: context,
    title: "Oops ",
    confirmBtnColor: Colors.teal.shade600,
    animType: CoolAlertAnimType.scale,
    type: CoolAlertType.info,
    text: "Bu bir front-end uygulamasıdır.",
  );
}

Widget createListTile(String header,String subtitle, Container container,BuildContext context){

  return ListTile(leading: container,
    title:Text(header,style: const TextStyle(fontWeight: FontWeight.bold),),
    subtitle:Text(subtitle),onTap: (){showAlertDialog(context);},);

}