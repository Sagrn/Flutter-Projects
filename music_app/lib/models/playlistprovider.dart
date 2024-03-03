
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlayListProvider extends ChangeNotifier{
  //Playlist of songs
 final List<Song> _playlist = [
//1st song
Song(songName: "First Song",
 atistName: "Artist One", 
 albumArtImagePath: "assets/images/one.png",
  audioPath: "assets/audio/mahabharat.mp3"),
  //2nd song
  Song(songName: "Second Song",
 atistName: "Artist One", 
 albumArtImagePath: "assets/images/two.png",
  audioPath: "assets/audio/mahabharat.mp3"),
  //3rd Song
  Song(songName: "Third Song",
 atistName: "Artist One", 
 albumArtImagePath: "assets/images/three.png",
  audioPath: "assets/audio/mahabharat.mp3"),
  ];

  //Current song playing index
  int? _currentSongIndex;

  //GETTER 
   List<Song> get playlist => _playlist;
   int? get currentSongInsex => _currentSongIndex;
  
  //SETTER
   set currentSongIndex(int? index){
    //update the curent song index
    _currentSongIndex = index;

    //update ui
    notifyListeners();
   }

}