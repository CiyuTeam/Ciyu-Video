// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Sentence extends Sentence {
  @override
  final String? id;
  @override
  final String? content;
  @override
  final String? translation;
  @override
  final String? source_;
  @override
  final Word? word;

  factory _$Sentence([void Function(SentenceBuilder)? updates]) =>
      (new SentenceBuilder()..update(updates))._build();

  _$Sentence._(
      {this.id, this.content, this.translation, this.source_, this.word})
      : super._();

  @override
  Sentence rebuild(void Function(SentenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SentenceBuilder toBuilder() => new SentenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sentence &&
        id == other.id &&
        content == other.content &&
        translation == other.translation &&
        source_ == other.source_ &&
        word == other.word;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, translation.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, word.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Sentence')
          ..add('id', id)
          ..add('content', content)
          ..add('translation', translation)
          ..add('source_', source_)
          ..add('word', word))
        .toString();
  }
}

class SentenceBuilder implements Builder<Sentence, SentenceBuilder> {
  _$Sentence? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _translation;
  String? get translation => _$this._translation;
  set translation(String? translation) => _$this._translation = translation;

  String? _source_;
  String? get source_ => _$this._source_;
  set source_(String? source_) => _$this._source_ = source_;

  WordBuilder? _word;
  WordBuilder get word => _$this._word ??= new WordBuilder();
  set word(WordBuilder? word) => _$this._word = word;

  SentenceBuilder() {
    Sentence._defaults(this);
  }

  SentenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _content = $v.content;
      _translation = $v.translation;
      _source_ = $v.source_;
      _word = $v.word?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sentence other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Sentence;
  }

  @override
  void update(void Function(SentenceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Sentence build() => _build();

  _$Sentence _build() {
    _$Sentence _$result;
    try {
      _$result = _$v ??
          new _$Sentence._(
              id: id,
              content: content,
              translation: translation,
              source_: source_,
              word: _word?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'word';
        _word?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Sentence', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
