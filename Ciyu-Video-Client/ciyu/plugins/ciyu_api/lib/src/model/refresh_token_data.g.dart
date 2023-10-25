// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RefreshTokenData extends RefreshTokenData {
  @override
  final String? refreshToken;

  factory _$RefreshTokenData(
          [void Function(RefreshTokenDataBuilder)? updates]) =>
      (new RefreshTokenDataBuilder()..update(updates))._build();

  _$RefreshTokenData._({this.refreshToken}) : super._();

  @override
  RefreshTokenData rebuild(void Function(RefreshTokenDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshTokenDataBuilder toBuilder() =>
      new RefreshTokenDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshTokenData && refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RefreshTokenData')
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class RefreshTokenDataBuilder
    implements Builder<RefreshTokenData, RefreshTokenDataBuilder> {
  _$RefreshTokenData? _$v;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  RefreshTokenDataBuilder() {
    RefreshTokenData._defaults(this);
  }

  RefreshTokenDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshTokenData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RefreshTokenData;
  }

  @override
  void update(void Function(RefreshTokenDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshTokenData build() => _build();

  _$RefreshTokenData _build() {
    final _$result =
        _$v ?? new _$RefreshTokenData._(refreshToken: refreshToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
