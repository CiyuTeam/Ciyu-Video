import 'package:test/test.dart';
import 'package:ciyu_api/ciyu_api.dart';


/// tests for HistoryControllerApi
void main() {
  final instance = CiyuApi().getHistoryControllerApi();

  group(HistoryControllerApi, () {
    //Future createHistory(String articleId) async
    test('test createHistory', () async {
      // TODO
    });

    //Future<SearchHitsArticle> getPaginatedHistories({ int page, int size, BuiltList<String> sort }) async
    test('test getPaginatedHistories', () async {
      // TODO
    });

  });
}
