import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
const Categories({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Escolha uma categoria"),
          centerTitle: true,
        ),
      ),
    );
  }
}