import 'package:test/test.dart';
import 'package:ciyu_api/ciyu_api.dart';


/// tests for BondControllerApi
void main() {
  final instance = CiyuApi().getBondControllerApi();

  group(BondControllerApi, () {
    //Future createBond(CreateBondDto createBondDto) async
    test('test createBond', () async {
      // TODO
    });

    //Future<BuiltList<GetBondsDto>> getBonds({ int page, int size, BuiltList<String> sort }) async
    test('test getBonds', () async {
      // TODO
    });

    //Future removeBond(String wordId) async
    test('test removeBond', () async {
      // TODO
    });

  });
}
