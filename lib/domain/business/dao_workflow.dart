import 'package:hyrule/domain/models/entry.dart';

abstract class DaoWorkflow {
  Future<List<Entry>> getSavedEntries();

  Future<void> saveEntry({required Entry entry});

  Future<void> deleteEntry({required Entry entry});
}