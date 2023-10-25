// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_bond_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateBondDto extends CreateBondDto {
  @override
  final String? meaningId;
  @override
  final String? articleId;
  @override
  final double? quality;

  factory _$CreateBondDto([void Function(CreateBondDtoBuilder)? updates]) =>
      (new CreateBondDtoBuilder()..update(updates))._build();

  _$CreateBondDto._({this.meaningId, this.articleId, this.quality}) : super._();

  @override
  CreateBondDto rebuild(void Function(CreateBondDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateBondDtoBuilder toBuilder() => new CreateBondDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateBondDto &&
        meaningId == other.meaningId &&
        articleId == other.articleId &&
        quality == other.quality;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meaningId.hashCode);
    _$hash = $jc(_$hash, articleId.hashCode);
    _$hash = $jc(_$hash, quality.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateBondDto')
          ..add('meaningId', meaningId)
          ..add('articleId', articleId)
          ..add('quality', quality))
        .toString();
  }
}

class CreateBondDtoBuilder
    implements Builder<CreateBondDto, CreateBondDtoBuilder> {
  _$CreateBondDto? _$v;

  String? _meaningId;
  String? get meaningId => _$this._meaningId;
  set meaningId(String? meaningId) => _$this._meaningId = meaningId;

  String? _articleId;
  String? get articleId => _$this._articleId;
  set articleId(String? articleId) => _$this._articleId = articleId;

  double? _quality;
  double? get quality => _$this._quality;
  set quality(double? quality) => _$this._quality = quality;

  CreateBondDtoBuilder() {
    CreateBondDto._defaults(this);
  }

  CreateBondDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meaningId = $v.meaningId;
      _articleId = $v.articleId;
      _quality = $v.quality;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateBondDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateBondDto;
  }

  @override
  void update(void Function(CreateBondDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateBondDto build() => _build();

  _$CreateBondDto _build() {
    final _$result = _$v ??
        new _$CreateBondDto._(
            meaningId: meaningId, articleId: articleId, quality: quality);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
