import 'package:flutter/material.dart';
import 'package:music_app/pages/settingpage.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: 
              Icon(
                Icons.music_note,
                size:50,
                color: Theme.of(context).colorScheme.inversePrimary,
                ),)
                ),
          Padding(
            padding: EdgeInsets.only(top: 25,left: 25),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left: 25,top: 0),
             child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("SETTINGS"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
              },
                       ),
           ),     

        ],
      ),
    );
  }
}