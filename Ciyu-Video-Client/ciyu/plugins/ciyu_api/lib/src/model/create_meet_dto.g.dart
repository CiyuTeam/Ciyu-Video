// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_meet_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateMeetDto extends CreateMeetDto {
  @override
  final String? meaningId;
  @override
  final String? articleId;
  @override
  final double? quality;

  factory _$CreateMeetDto([void Function(CreateMeetDtoBuilder)? updates]) =>
      (new CreateMeetDtoBuilder()..update(updates))._build();

  _$CreateMeetDto._({this.meaningId, this.articleId, this.quality}) : super._();

  @override
  CreateMeetDto rebuild(void Function(CreateMeetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateMeetDtoBuilder toBuilder() => new CreateMeetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateMeetDto &&
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
    return (newBuiltValueToStringHelper(r'CreateMeetDto')
          ..add('meaningId', meaningId)
          ..add('articleId', articleId)
          ..add('quality', quality))
        .toString();
  }
}

class CreateMeetDtoBuilder
    implements Builder<CreateMeetDto, CreateMeetDtoBuilder> {
  _$CreateMeetDto? _$v;

  String? _meaningId;
  String? get meaningId => _$this._meaningId;
  set meaningId(String? meaningId) => _$this._meaningId = meaningId;

  String? _articleId;
  String? get articleId => _$this._articleId;
  set articleId(String? articleId) => _$this._articleId = articleId;

  double? _quality;
  double? get quality => _$this._quality;
  set quality(double? quality) => _$this._quality = quality;

  CreateMeetDtoBuilder() {
    CreateMeetDto._defaults(this);
  }

  CreateMeetDtoBuilder get _$this {
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
  void replace(CreateMeetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateMeetDto;
  }

  @override
  void update(void Function(CreateMeetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateMeetDto build() => _build();

  _$CreateMeetDto _build() {
    final _$result = _$v ??
        new _$CreateMeetDto._(
            meaningId: meaningId, articleId: articleId, quality: quality);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
