// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meet_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeetDto extends MeetDto {
  @override
  final String? id;
  @override
  final double? quality;
  @override
  final DateTime? createdTime;
  @override
  final Meaning? meaning;
  @override
  final Article? article;

  factory _$MeetDto([void Function(MeetDtoBuilder)? updates]) =>
      (new MeetDtoBuilder()..update(updates))._build();

  _$MeetDto._(
      {this.id, this.quality, this.createdTime, this.meaning, this.article})
      : super._();

  @override
  MeetDto rebuild(void Function(MeetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeetDtoBuilder toBuilder() => new MeetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeetDto &&
        id == other.id &&
        quality == other.quality &&
        createdTime == other.createdTime &&
        meaning == other.meaning &&
        article == other.article;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, quality.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, meaning.hashCode);
    _$hash = $jc(_$hash, article.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeetDto')
          ..add('id', id)
          ..add('quality', quality)
          ..add('createdTime', createdTime)
          ..add('meaning', meaning)
          ..add('article', article))
        .toString();
  }
}

class MeetDtoBuilder implements Builder<MeetDto, MeetDtoBuilder> {
  _$MeetDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _quality;
  double? get quality => _$this._quality;
  set quality(double? quality) => _$this._quality = quality;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  MeaningBuilder? _meaning;
  MeaningBuilder get meaning => _$this._meaning ??= new MeaningBuilder();
  set meaning(MeaningBuilder? meaning) => _$this._meaning = meaning;

  ArticleBuilder? _article;
  ArticleBuilder get article => _$this._article ??= new ArticleBuilder();
  set article(ArticleBuilder? article) => _$this._article = article;

  MeetDtoBuilder() {
    MeetDto._defaults(this);
  }

  MeetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _quality = $v.quality;
      _createdTime = $v.createdTime;
      _meaning = $v.meaning?.toBuilder();
      _article = $v.article?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeetDto;
  }

  @override
  void update(void Function(MeetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeetDto build() => _build();

  _$MeetDto _build() {
    _$MeetDto _$result;
    try {
      _$result = _$v ??
          new _$MeetDto._(
              id: id,
              quality: quality,
              createdTime: createdTime,
              meaning: _meaning?.build(),
              article: _article?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meaning';
        _meaning?.build();
        _$failedField = 'article';
        _article?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MeetDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
