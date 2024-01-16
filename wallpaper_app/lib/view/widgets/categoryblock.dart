import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/categoryscreen.dart';
import '../screens/searchscreen.dart';

class CategoryBlock extends StatelessWidget {
  List<String> categoryList ;
  int index;
  List<String> categoryUrl;
   CategoryBlock({super.key,required this.categoryList,required this.index,required this.categoryUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child:InkWell(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius:BorderRadius.circular(20),
              child: Image.network(
                  categoryUrl[index],
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
              // top: 12,
              left: 10,
                child: Center(child: Text(categoryList[index],style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w600),)))
          ],
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(query:categoryList[index],)));
        },
      )
    );
  }
}
