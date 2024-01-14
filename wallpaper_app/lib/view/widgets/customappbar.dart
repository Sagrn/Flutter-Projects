import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String word1 ;
  String word2;
  CustomAppBar({super.key,required this.word1,required this.word2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: word1,
              style: TextStyle(fontSize: 23,color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: " $word2",
              style: TextStyle(fontSize: 25,color: Colors.black54,fontWeight: FontWeight.w600)
            )
          ]
        ),

      ),
    );
  }
}
