import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Models/Person.dart';
import 'package:whatsapp_clone/Views/Components/calls.dart';
import 'package:whatsapp_clone/Views/Components/chats.dart';
import 'package:whatsapp_clone/Views/Components/status.dart';
import 'package:whatsapp_clone/Views/Components/camera.dart';
import 'package:whatsapp_clone/Views/SettingsPage.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{


  List<String> kurallar1=["New group","New broadcast","Linked devices","Starred messages","Settings"];
  List<String> kurallar2=["Status privacy","Settings"];
  List<String> kurallar3=["Clear call log","Settings"];

  final List<dynamic> _tabs = <dynamic>[
    const Icon(Icons.camera_alt_rounded),
    "CHATS",
    "STATUS",
    "CALLS",
  ];

  Widget _popUpMenu=PopupMenuButton<String>(itemBuilder: (BuildContext context){
    return [const PopupMenuItem(child: Text(""),value: "")];
  });

  late bool isFloat;
  late TabController tabController;
  
  @override
  void initState() {
    super.initState();
    _popUpMenu= createPopUpButton(kurallar1, context);
    tabController=TabController(length: _tabs.length, vsync: this,initialIndex: 1);
    isFloat=true;

    tabController.addListener(() {

      setState(() {
        if(tabController.index==1){
          _popUpMenu= createPopUpButton(kurallar1, context);
          isFloat=true;
        }
        else if(tabController.index==2){
          _popUpMenu=createPopUpButton(kurallar2, context);
          isFloat=false;

        }
        else if(tabController.index==3){
          _popUpMenu=createPopUpButton(kurallar3, context);
          isFloat=true;
        }
        else{
          _popUpMenu=createPopUpButton(["Burada bir şey yok!"], context);
          isFloat=false;
        }
      });


    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> names=["Erdal","Emre","Melis"];
    List<String> lastNames=["Nayir","Nayir","Nayir"];

    List<Person> allPersons=List.generate(50, (index) => Person(names[index%2],
        lastNames[index%2],
        "Çok güzel bir clone",
        "Yesterday"));


    return Scaffold(
        body: DefaultTabController(
          length: _tabs.length, // This is the number of tabs.
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      title: const Padding(child: Text('WhatsApp'),padding: EdgeInsets.only(top: 5),),
                      backgroundColor: Colors.teal.shade600,
                      floating: isFloat,
                      pinned: true,
                      snap: false,
                      primary: false,
                      forceElevated: innerBoxIsScrolled,
                      actions:[Padding(child: _popUpMenu,padding: const EdgeInsets.only(top: 5),)],
                      bottom: TabBar(
                        controller: tabController,
                        tabs: _tabs
                            .map((dynamic name) =>
                        (name is Icon)
                            ? SizedBox(child: Tab(icon: name), width: 5,)
                            : Tab(text: name))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(controller: tabController,children: [
              Camera(tabKey: _tabs[0]),
              Chats(persons: allPersons, tabKey: _tabs[1]),
              Status(persons: allPersons, tabKey: _tabs[2]),
              Calls(persons: allPersons, tabKey: _tabs[3]),
            ]
            ),
          ),
        ),
    );
  }
}

Widget createPopUpButton(List<String> kurallar,BuildContext context){
  return PopupMenuButton<String>(onSelected: (String result){ (result=="Settings")? navigateSettingPage(context,_createRoute()) : showAlertDialog(context);},
      itemBuilder: (BuildContext context){
        return kurallar.map((e) =>
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
    text: "Bu bölge erişime kapalı",
  );
}

void navigateSettingPage(BuildContext context,Route route ){
  Navigator.of(context).push(route);
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SettingPage(),
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
