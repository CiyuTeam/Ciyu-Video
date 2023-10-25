// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TokenDto extends TokenDto {
  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  factory _$TokenDto([void Function(TokenDtoBuilder)? updates]) =>
      (new TokenDtoBuilder()..update(updates))._build();

  _$TokenDto._({this.accessToken, this.refreshToken}) : super._();

  @override
  TokenDto rebuild(void Function(TokenDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenDtoBuilder toBuilder() => new TokenDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenDto &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TokenDto')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class TokenDtoBuilder implements Builder<TokenDto, TokenDtoBuilder> {
  _$TokenDto? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  TokenDtoBuilder() {
    TokenDto._defaults(this);
  }

  TokenDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TokenDto;
  }

  @override
  void update(void Function(TokenDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenDto build() => _build();

  _$TokenDto _build() {
    final _$result = _$v ??
        new _$TokenDto._(accessToken: accessToken, refreshToken: refreshToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
