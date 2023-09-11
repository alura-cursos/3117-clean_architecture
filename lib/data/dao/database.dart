import 'dart:async';
import 'package:floor/floor.dart';
import 'package:hyrule/data/dao/entry_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../domain/models/entry.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Entry])
abstract class AppDatabase extends FloorDatabase {
  EntryDao get entryDao;
}