import 'package:hyrule/data/dao/database.dart';
import 'package:hyrule/domain/business/dao_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

import '../data/dao/entry_dao.dart';

class DaoController implements DaoWorkflow {
  Future<EntryDao> createDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
    final EntryDao entryDao = database.entryDao;
    return entryDao;
  }

  @override
  Future<void> deleteEntry({required Entry entry}) async {
    final EntryDao entryDao = await createDatabase();
    entryDao.removeEntry(entry);
  }

  @override
  Future<List<Entry>> getSavedEntries() async {
    final EntryDao entryDao = await createDatabase();
    return entryDao.getAllEntries();
  }

  @override
  Future<void> saveEntry({required Entry entry}) async {
    final EntryDao entryDao = await createDatabase();
    entryDao.addEntry(entry);
  }
}