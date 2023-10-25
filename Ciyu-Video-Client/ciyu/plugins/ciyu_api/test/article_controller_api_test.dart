import 'package:test/test.dart';
import 'package:ciyu_api/ciyu_api.dart';


/// tests for ArticleControllerApi
void main() {
  final instance = CiyuApi().getArticleControllerApi();

  group(ArticleControllerApi, () {
    //Future<SearchHitsArticle> getBestArticles(BuiltList<String> excludedArticleIds, { int page, int size, BuiltList<String> sort }) async
    test('test getBestArticles', () async {
      // TODO
    });

    //Future<SearchHitsArticle> searchByWordId(String wordId, { int page, int size, BuiltList<String> sort }) async
    test('test searchByWordId', () async {
      // TODO
    });

  });
}
