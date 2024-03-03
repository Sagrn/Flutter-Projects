import 'package:flutter/material.dart';
import 'package:music_app/models/playlistprovider.dart';
import 'package:music_app/pages/home.dart';
import 'package:music_app/themes/darktheme.dart';
import 'package:music_app/themes/lighttheme.dart';
import 'package:music_app/themes/themeprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
           MultiProvider(providers: [
            ChangeNotifierProvider(create: (context) => ThemeProvider(),),
            ChangeNotifierProvider(create: (context) => PlayListProvider(),),
           ],
           child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme:Provider.of<ThemeProvider>(context).themeData
    );
  }
}

