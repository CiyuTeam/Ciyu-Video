import 'package:test/test.dart';
import 'package:ciyu_api/ciyu_api.dart';


/// tests for SentenceControllerApi
void main() {
  final instance = CiyuApi().getSentenceControllerApi();

  group(SentenceControllerApi, () {
    //Future<String> generateCompletions(String beforeText, BuiltList<String> excludedWordIds, { int page, int size, BuiltList<String> sort }) async
    test('test generateCompletions', () async {
      // TODO
    });

  });
}
