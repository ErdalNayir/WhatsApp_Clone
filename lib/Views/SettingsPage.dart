import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<String> headers=["Erdal Nayir","Account","Chats","Notifications","Storage and Data","Help","Invite a friend"];
    List<String> subtitles=[
      "Busy",
      "Privacy,security,change number",
      "Theme, wallpapers, chat history",
      "Message, group & call tones",
      "Network usage, auto-download",
      "Help center, contact us, privacy policy",
      " "];

    String _url="https://nextflow.in.th/wp-content/uploads/Google-Flutter-logo-dark-gray-bg-cover.png";


    return Scaffold(appBar:
    AppBar(
      title:const Text("Settings",
        style: TextStyle(
            color:Colors.white),
      ),
      backgroundColor: Colors.teal.shade600,
      leading: IconButton(
        icon:const Icon(Icons.arrow_back,
          color: Colors.white,),
        onPressed: (){
          Navigator.of(context).pop();
        },),
    ),
      body: ListView(
        primary: false,
        children:[ListTile(leading: CircleAvatar(backgroundImage: NetworkImage(_url),radius: 30,),
          title:Text(headers[0],
            style:const TextStyle(
              fontSize:20,  ),),
          subtitle:Text(subtitles[0]),
          trailing:IconButton(
            icon:Icon(Icons.qr_code,color: Colors.teal.shade600,),onPressed:(){showAlertDialog(context);} ,),
          onTap: (){showAlertDialog(context);},
        ),
          const Divider(thickness: 1,),
          createListTile(headers[1],subtitles[1],const Icon(Icons.key),context),
          createListTile(headers[2],subtitles[2],const Icon(Icons.message),context),
          createListTile(headers[3],subtitles[3],const Icon(Icons.notifications),context),
          createListTile(headers[4],subtitles[4],const Icon(Icons.radio_button_unchecked),context),
          createListTile(headers[5],subtitles[5],const Icon(Icons.help_outline),context),
          createListTile(headers[6],subtitles[6],const Icon(Icons.person_add),context),
          
          Center(
            child: Column(
              children: const [
                Text("from",style: TextStyle(color: Colors.grey),),
                Text(" ",style: TextStyle(height: 0.5),),
                Text("Erdal Nayir",style: TextStyle(fontWeight: FontWeight.bold),),
                Text(" ",style: TextStyle(height: 1),),
                Text(" ",style: TextStyle(height: 1),),
                Text(" ",style: TextStyle(height: 1),),],),
          )
          ]
    ));
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

Widget createListTile(String header,String subtitle, Icon icon,BuildContext context){

  return ListTile(leading: icon,
            title:Text(header),
            subtitle:Text(subtitle),onTap: (){showAlertDialog(context);},);

}