// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Word extends Word {
  @override
  final String? id;
  @override
  final BuiltList<Meaning>? meanings;
  @override
  final BuiltList<Phonetic>? phonetics;
  @override
  final BuiltList<Sentence>? sentences;

  factory _$Word([void Function(WordBuilder)? updates]) =>
      (new WordBuilder()..update(updates))._build();

  _$Word._({this.id, this.meanings, this.phonetics, this.sentences})
      : super._();

  @override
  Word rebuild(void Function(WordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WordBuilder toBuilder() => new WordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Word &&
        id == other.id &&
        meanings == other.meanings &&
        phonetics == other.phonetics &&
        sentences == other.sentences;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, meanings.hashCode);
    _$hash = $jc(_$hash, phonetics.hashCode);
    _$hash = $jc(_$hash, sentences.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Word')
          ..add('id', id)
          ..add('meanings', meanings)
          ..add('phonetics', phonetics)
          ..add('sentences', sentences))
        .toString();
  }
}

class WordBuilder implements Builder<Word, WordBuilder> {
  _$Word? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<Meaning>? _meanings;
  ListBuilder<Meaning> get meanings =>
      _$this._meanings ??= new ListBuilder<Meaning>();
  set meanings(ListBuilder<Meaning>? meanings) => _$this._meanings = meanings;

  ListBuilder<Phonetic>? _phonetics;
  ListBuilder<Phonetic> get phonetics =>
      _$this._phonetics ??= new ListBuilder<Phonetic>();
  set phonetics(ListBuilder<Phonetic>? phonetics) =>
      _$this._phonetics = phonetics;

  ListBuilder<Sentence>? _sentences;
  ListBuilder<Sentence> get sentences =>
      _$this._sentences ??= new ListBuilder<Sentence>();
  set sentences(ListBuilder<Sentence>? sentences) =>
      _$this._sentences = sentences;

  WordBuilder() {
    Word._defaults(this);
  }

  WordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _meanings = $v.meanings?.toBuilder();
      _phonetics = $v.phonetics?.toBuilder();
      _sentences = $v.sentences?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Word other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Word;
  }

  @override
  void update(void Function(WordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Word build() => _build();

  _$Word _build() {
    _$Word _$result;
    try {
      _$result = _$v ??
          new _$Word._(
              id: id,
              meanings: _meanings?.build(),
              phonetics: _phonetics?.build(),
              sentences: _sentences?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meanings';
        _meanings?.build();
        _$failedField = 'phonetics';
        _phonetics?.build();
        _$failedField = 'sentences';
        _sentences?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Word', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
