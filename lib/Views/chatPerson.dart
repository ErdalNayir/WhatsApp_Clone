import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import '../Models/Person.dart';

class ChatPerson extends StatefulWidget {
  final Person person;
  const ChatPerson({Key? key ,required this.person}) : super(key: key);


  @override
  _ChatPersonState createState() => _ChatPersonState(person);
}

class _ChatPersonState extends State<ChatPerson> {
  Person person;

  _ChatPersonState(this.person);

  @override
  Widget build(BuildContext context) {
    String _url="https://www.ixpap.com/images/2021/02/whatsapp-wallpaper-ixpap-2.jpg";
    return Scaffold(appBar:
    AppBar(leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,size: 25,),),

      title: Row(children:[Padding(
        child: CircleAvatar(backgroundImage:
        NetworkImage(person.profile),
          radius: 20,),
        padding: const EdgeInsets.only(right: 10),
      ),
        Text(person.name+" "+person.surname,),]),
      backgroundColor: Colors.teal.shade600,
      actions: [
        createIconButton(const Icon(Icons.videocam,color: Colors.white,), context, 5),
        createIconButton(const Icon(Icons.phone,color: Colors.white,), context, 0),
        createPopUpMenu(context)
      ],),
    body: SafeArea(
      bottom: false,
      child: Container(decoration: BoxDecoration(
                image: DecorationImage(
                  image:NetworkImage(_url),fit: BoxFit.cover), ),
        child:SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Flexible(
                child: Card(
                  margin: const EdgeInsets.only(bottom: 4,right: 4,left: 2),
                  child: TextFormField(cursorColor: Colors.teal.shade600,cursorHeight: 20,
                  decoration: InputDecoration(border: InputBorder.none,
                      hintText: "Message",hintStyle: const TextStyle(color: Colors.grey,fontSize: 20),
                      contentPadding:const EdgeInsets.only(left: 0,top: 11),
                      icon: IconButton(icon: const Icon(Icons.emoji_emotions_outlined,color: Colors.grey,),
                        onPressed:(){showAlertDialog(context);} ,),
                    suffixIcon: Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      IconButton(onPressed: (){showAlertDialog(context);}, icon: const Icon(Icons.architecture,color: Colors.grey,)),
                      IconButton(onPressed: (){showAlertDialog(context);}, icon: const Icon(Icons.camera_alt_rounded,color: Colors.grey,))
                    ],)
                  ),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                ),
                ),
                GestureDetector(child: CircleAvatar(backgroundColor: Colors.teal.shade600,child: const Icon(Icons.mic,color: Colors.white,),radius: 25,),
                  onTap:(){showAlertDialog(context);} ,)
              ],),
            )
          ],),
        )

      ),
    ),
    );
  }
}


Widget createIconButton(Icon icon, BuildContext context,double padding){
  return Padding(child: IconButton(onPressed: (){showAlertDialog(context);}, icon: icon),padding: EdgeInsets.only(right: padding),);
}

Widget createPopUpMenu(context){
  List<String> _kurallar=["View Contact","Media, links, and docs","Search","Mute notification","Wallpaper","More"];
  return PopupMenuButton<String>(onSelected:(String result) {showAlertDialog(context);},
    itemBuilder: (BuildContext context) {
      return _kurallar.map((e) =>
          PopupMenuItem(child: Text(e.toString()), value: e.toString()))
          .toList();
    });

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