import 'package:hyrule/data/api/data_api.dart';
import 'package:hyrule/domain/business/api_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

class ApiController implements ApiWorkflow {
  final DataApi dataApi = DataApi();

  @override
  Future<List<Entry>> getEntriesByCategory({required String category}) {
    return dataApi.getEntriesByCategory(category: category);
  }
}