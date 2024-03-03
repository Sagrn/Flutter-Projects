import 'package:flutter/material.dart';
import 'package:music_app/components/neubox.dart';
import 'package:music_app/models/playlistprovider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
      builder: (context,value,child){
        return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
         child: Column(
          children: [
            //app bar
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Back buton 
                Icon(Icons.arrow_back),
                //title
                Text("PLAYLIST"),
                //menu button
                Icon(Icons.menu)
              ],
             )
         
            //art work image
         
         
            //song progress bar
         
         
         
            //songs controls
         
         
            
          ],
         ),
       ),
     )
    );
      },
    );
  }
}