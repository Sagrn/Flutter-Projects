import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/searchscreen.dart';

class CustomSearchBar extends StatelessWidget {

  CustomSearchBar({super.key});

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Wallpaper",
                hintStyle: TextStyle(color: Colors.black26),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: (){ 
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(query:_searchController.text)));
            },
              child: Icon(Icons.search))
        ],
      ),
    );
  }
}
