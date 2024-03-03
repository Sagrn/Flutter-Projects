
import 'package:flutter/material.dart';
import 'package:music_app/themes/darktheme.dart';
import 'package:music_app/themes/lighttheme.dart';

class ThemeProvider extends ChangeNotifier{
  //initiall light theme
  ThemeData _themeData = lightTheme;
  //get theme
  ThemeData get  themeData  => _themeData;
  //is dark mode
  bool get isDarkMode => _themeData == darkTheme;
  //set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;
//update UI
notifyListeners();
  }
  //toggle theme
  void toogleTheme(){
    if(_themeData==lightTheme){
      themeData = darkTheme;
    }else{
      themeData = lightTheme;
    }
  }
}