import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Models/Person.dart';
import 'package:whatsapp_clone/Views/chatPerson.dart';

class Chats extends StatelessWidget {
  final List<Person> persons;
  final dynamic tabKey;
  const Chats({Key? key,required this.persons,required this.tabKey}) : super(key: key);


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
                      Text(persons[index].lastSeen,
                          style: TextStyle(color: Colors.grey.shade600,
                              fontSize: 13))],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    subtitle: Text(persons[index%3].name+" : "+persons[index].lastMessage),
                    onTap: (){Navigator.of(context).push(_createRoute(persons[index]));},
                  )
              );
            },childCount: persons.length,
            )),
          ],),
        floatingActionButton: FloatingActionButton(child:const Icon(Icons.message,color: Colors.white), onPressed: (){},backgroundColor: Colors.teal.shade600,));

      }
    ),

    );
  }
}

Route _createRoute(Person person) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ChatPerson(person: person),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
