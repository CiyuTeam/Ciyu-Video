import 'package:test/test.dart';
import 'package:ciyu_api/ciyu_api.dart';


/// tests for GlossaryControllerApi
void main() {
  final instance = CiyuApi().getGlossaryControllerApi();

  group(GlossaryControllerApi, () {
    //Future<Glossary> getCurrentGlossary() async
    test('test getCurrentGlossary', () async {
      // TODO
    });

    //Future<JsonObject> getGlossaries() async
    test('test getGlossaries', () async {
      // TODO
    });

    //Future<Glossary> getGlossaryById(String id) async
    test('test getGlossaryById', () async {
      // TODO
    });

    //Future setCurrentGlossary(Glossary glossary) async
    test('test setCurrentGlossary', () async {
      // TODO
    });

  });
}
