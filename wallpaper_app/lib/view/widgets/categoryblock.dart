import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryBlock extends StatelessWidget {
  const CategoryBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child:Stack(
        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(20),
            child: Image.network(
                "https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            height: 50,
            width: 100,
            fit: BoxFit.cover,),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          Positioned(
            top: 12,
            left: 30,
              child: Text("Cars",style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w600),))
        ],
      )
    );
  }
}
