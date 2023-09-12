import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';
import 'package:hyrule/utils/theme.dart';

class EntryCard extends StatelessWidget {
  EntryCard({Key? key, required this.entry, required this.isSaved}) : super(key: key);
  final Entry entry;
  final bool isSaved;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Dismissible(
        direction: isSaved ? DismissDirection.endToStart :  DismissDirection.none,
        key: ValueKey<int>(entry.id),
        background: Container(
          color: Colors.redAccent,
          child: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.delete),
            ),
          ),
        ),
        onDismissed: (direction) {
          daoController.deleteEntry(entry: entry);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Deletado")));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 180,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(entry: entry),
                      ));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(entry.image),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 8.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(entry.name.toUpperCase(), style: EntryDecoration.titleText,),
                          ),
                            Flexible(
                                child: Text(
                              entry.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            )),
                        ],),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: entry.commonLocationsConverter().map(
                        (e) => Chip(
                          label: Text(e),
                        )
                      ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
