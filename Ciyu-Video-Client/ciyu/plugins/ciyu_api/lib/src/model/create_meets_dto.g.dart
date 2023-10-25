// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_meets_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateMeetsDto extends CreateMeetsDto {
  @override
  final String? articleId;
  @override
  final BuiltList<String>? wordIds;

  factory _$CreateMeetsDto([void Function(CreateMeetsDtoBuilder)? updates]) =>
      (new CreateMeetsDtoBuilder()..update(updates))._build();

  _$CreateMeetsDto._({this.articleId, this.wordIds}) : super._();

  @override
  CreateMeetsDto rebuild(void Function(CreateMeetsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateMeetsDtoBuilder toBuilder() =>
      new CreateMeetsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateMeetsDto &&
        articleId == other.articleId &&
        wordIds == other.wordIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, articleId.hashCode);
    _$hash = $jc(_$hash, wordIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateMeetsDto')
          ..add('articleId', articleId)
          ..add('wordIds', wordIds))
        .toString();
  }
}

class CreateMeetsDtoBuilder
    implements Builder<CreateMeetsDto, CreateMeetsDtoBuilder> {
  _$CreateMeetsDto? _$v;

  String? _articleId;
  String? get articleId => _$this._articleId;
  set articleId(String? articleId) => _$this._articleId = articleId;

  ListBuilder<String>? _wordIds;
  ListBuilder<String> get wordIds =>
      _$this._wordIds ??= new ListBuilder<String>();
  set wordIds(ListBuilder<String>? wordIds) => _$this._wordIds = wordIds;

  CreateMeetsDtoBuilder() {
    CreateMeetsDto._defaults(this);
  }

  CreateMeetsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _articleId = $v.articleId;
      _wordIds = $v.wordIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateMeetsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateMeetsDto;
  }

  @override
  void update(void Function(CreateMeetsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateMeetsDto build() => _build();

  _$CreateMeetsDto _build() {
    _$CreateMeetsDto _$result;
    try {
      _$result = _$v ??
          new _$CreateMeetsDto._(
              articleId: articleId, wordIds: _wordIds?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'wordIds';
        _wordIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateMeetsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
