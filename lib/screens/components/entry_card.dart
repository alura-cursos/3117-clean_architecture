import 'package:flutter/material.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({Key? key, required this.entry}) : super(key: key);
  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(entry: entry),
                  ));
            },
            child: Ink(
              child: Row(
                children: <Widget>[
                  Image.network(entry.image),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(entry.name),
                    Text(entry.description),
                  ],)
                ],
              ),
            ),
          ),
          Wrap(
            children: entry.commonLocationsConverter().map(
                  (e) => Chip(
                    label: Text(e),
                  )
                ).toList(),
          ),
        ],
      ),
    );
  }
}
