import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  final dynamic tabKey;
  const Camera({Key? key,required this.tabKey}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      key: PageStorageKey<dynamic>(tabKey),
      child: Center(child:
              Container(child:
                const Center(child:
                  Text("Bu bölge erişime kapalıdır",style: TextStyle(color:
                  Colors.black,
                      fontSize:24,fontWeight: FontWeight.bold),),),decoration:
                    BoxDecoration(gradient:
                      const LinearGradient(colors:
                [Colors.teal,Colors.white],begin: Alignment.bottomLeft, end: Alignment.topRight),
                borderRadius: BorderRadius.circular(30)

      ),
                width: 300,
                height: 200,
      )
      ),
    );

  }
}



