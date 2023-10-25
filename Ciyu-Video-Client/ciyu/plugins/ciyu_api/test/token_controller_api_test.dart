import 'package:test/test.dart';
import 'package:ciyu_api/ciyu_api.dart';


/// tests for TokenControllerApi
void main() {
  final instance = CiyuApi().getTokenControllerApi();

  group(TokenControllerApi, () {
    //Future<TokenDto> exchangeToken(String loginToken) async
    test('test exchangeToken', () async {
      // TODO
    });

    //Future<TokenDto> login(String phone, String password) async
    test('test login', () async {
      // TODO
    });

    //Future<TokenDto> refreshToken(RefreshTokenData refreshTokenData) async
    test('test refreshToken', () async {
      // TODO
    });

  });
}
