import 'package:flutter/material.dart';
import 'package:music_app/components/drawer.dart';
import 'package:music_app/models/playlistprovider.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/pages/songpage.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

late final dynamic playListProvider ;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get the playlist provider 
    playListProvider = Provider.of<PlayListProvider>(context,listen:false);
  }

  //go to a song

  void goToSong(int songIndex){
    //update current song index
playListProvider.currentSongIndex = songIndex;

    //navigate to song page
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => SongPage())
          );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        backgroundColor: Theme.of(context).colorScheme.background,
        ),
      drawer: DrawerWidget(),
      body: Consumer<PlayListProvider>(
        builder: (context,value,index){
          //get the playlist
          final List<Song> playlist = value.playlist;
          //return list view UI
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context,index){
            final Song song = playlist[index];

            //return the List Tile
            return ListTile(
                      
                      title: Text(song.songName),
                      subtitle: Text(song.atistName),
                      leading: Container(
                        height: 55,width: 55,
                        child: Image.asset(song.albumArtImagePath,fit:BoxFit.cover,)),
                        onTap: () => goToSong(index),
            );
          });
        },
      ),
    );
  }
}