import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/themes/themeprovider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Settings"),
        
      ),
      body: Container(

        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),

         decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20)
         ),

        child:Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold),),

            CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context,listen:false).isDarkMode,
               onChanged:(value) => Provider.of<ThemeProvider>(context,listen:false).toogleTheme())
          ],
          )
      ),
    );
  }
}