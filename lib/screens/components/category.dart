import 'package:flutter/material.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Category extends StatelessWidget {
const Category({ Key? key, required this.category }) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context){
    return Column(children: <Widget>[
        InkWell(
          onTap: () {},
          child: Ink(
            child: Center(
              child: Image.asset("$imagePath$category.png"),
            ),
          ),
        ),
        Text(categories[category]!),
    ],);
  }
}