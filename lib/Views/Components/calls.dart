import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Models/Person.dart';

class Calls extends StatelessWidget {
  final List<Person> persons;
  final dynamic tabKey;
  const Calls({Key? key,required this.persons,required this.tabKey}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top:false,
        bottom: false,
        child: Builder(
            builder:
                (BuildContext context){
              return Scaffold(
                body: CustomScrollView(
                  key: PageStorageKey<dynamic>(tabKey),
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),),
                    SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                      return Card(elevation: 0,
                          margin: EdgeInsets.zero,
                          color: Colors.white,
                          child: ListTile(leading:CircleAvatar(backgroundImage: NetworkImage(persons[index].profile),
                            radius: 20,
                          ),
                            title:Row(children: [Text(persons[index].name+" "+persons[index].surname,
                                style: const TextStyle(fontWeight: FontWeight.bold)
                            ),
                              (index%2==0)?IconButton(icon: Icon(Icons.videocam_rounded,color: Colors.teal.shade600,size: 25,),onPressed: (){showAlertDialog(context);},) :
                              IconButton(icon: Icon(Icons.phone,color: Colors.teal.shade600,size: 25,),onPressed: (){showAlertDialog(context);},)
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            subtitle: Row(children: [(index%2==0)?const Icon(Icons.call_made_sharp,color: Colors.green,size: 20,) :const Icon(Icons.call_received_rounded,color: Colors.red,size: 20,)
                              ,const Text("Yesterday")] ),
                            onTap: (){showAlertDialog(context);},
                          )
                      );
                    },childCount: persons.length,
                    )),
                  ],),
                floatingActionButton:FloatingActionButton(child:const Icon(Icons.add_call,color: Colors.white), onPressed: (){showAlertDialog(context);},backgroundColor: Colors.teal.shade600,));

            }
        )
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