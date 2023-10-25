// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterDto extends RegisterDto {
  @override
  final String? phone;
  @override
  final String? password;

  factory _$RegisterDto([void Function(RegisterDtoBuilder)? updates]) =>
      (new RegisterDtoBuilder()..update(updates))._build();

  _$RegisterDto._({this.phone, this.password}) : super._();

  @override
  RegisterDto rebuild(void Function(RegisterDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterDtoBuilder toBuilder() => new RegisterDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterDto &&
        phone == other.phone &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterDto')
          ..add('phone', phone)
          ..add('password', password))
        .toString();
  }
}

class RegisterDtoBuilder implements Builder<RegisterDto, RegisterDtoBuilder> {
  _$RegisterDto? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  RegisterDtoBuilder() {
    RegisterDto._defaults(this);
  }

  RegisterDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterDto;
  }

  @override
  void update(void Function(RegisterDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterDto build() => _build();

  _$RegisterDto _build() {
    final _$result =
        _$v ?? new _$RegisterDto._(phone: phone, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
