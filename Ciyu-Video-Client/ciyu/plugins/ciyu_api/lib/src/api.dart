//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:ciyu_api/src/serializers.dart';
import 'package:ciyu_api/src/auth/api_key_auth.dart';
import 'package:ciyu_api/src/auth/basic_auth.dart';
import 'package:ciyu_api/src/auth/bearer_auth.dart';
import 'package:ciyu_api/src/auth/oauth.dart';
import 'package:ciyu_api/src/api/article_controller_api.dart';
import 'package:ciyu_api/src/api/bond_controller_api.dart';
import 'package:ciyu_api/src/api/glossary_controller_api.dart';
import 'package:ciyu_api/src/api/history_controller_api.dart';
import 'package:ciyu_api/src/api/meet_controller_api.dart';
import 'package:ciyu_api/src/api/sentence_controller_api.dart';
import 'package:ciyu_api/src/api/token_controller_api.dart';
import 'package:ciyu_api/src/api/user_controller_api.dart';
import 'package:ciyu_api/src/api/word_controller_api.dart';

class CiyuApi {
  static const String basePath = r'http://localhost:44333';

  final Dio dio;
  final Serializers serializers;

  CiyuApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: 5000,
              receiveTimeout: 3000,
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get ArticleControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ArticleControllerApi getArticleControllerApi() {
    return ArticleControllerApi(dio, serializers);
  }

  /// Get BondControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BondControllerApi getBondControllerApi() {
    return BondControllerApi(dio, serializers);
  }

  /// Get GlossaryControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GlossaryControllerApi getGlossaryControllerApi() {
    return GlossaryControllerApi(dio, serializers);
  }

  /// Get HistoryControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  HistoryControllerApi getHistoryControllerApi() {
    return HistoryControllerApi(dio, serializers);
  }

  /// Get MeetControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MeetControllerApi getMeetControllerApi() {
    return MeetControllerApi(dio, serializers);
  }

  /// Get SentenceControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SentenceControllerApi getSentenceControllerApi() {
    return SentenceControllerApi(dio, serializers);
  }

  /// Get TokenControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TokenControllerApi getTokenControllerApi() {
    return TokenControllerApi(dio, serializers);
  }

  /// Get UserControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserControllerApi getUserControllerApi() {
    return UserControllerApi(dio, serializers);
  }

  /// Get WordControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  WordControllerApi getWordControllerApi() {
    return WordControllerApi(dio, serializers);
  }
}
