import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';

import '../domain/models/entry.dart';

class Details extends StatelessWidget {
Details({ Key? key, required this.entry }) : super(key: key);
  final Entry entry;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detalhes"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          daoController.saveEntry(entry: entry);
        },),
      ),
    );
  }
}