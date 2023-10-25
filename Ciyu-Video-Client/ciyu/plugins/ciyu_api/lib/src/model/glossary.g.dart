// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glossary.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Glossary extends Glossary {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final BuiltList<Word>? words;

  factory _$Glossary([void Function(GlossaryBuilder)? updates]) =>
      (new GlossaryBuilder()..update(updates))._build();

  _$Glossary._({this.id, this.name, this.words}) : super._();

  @override
  Glossary rebuild(void Function(GlossaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlossaryBuilder toBuilder() => new GlossaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Glossary &&
        id == other.id &&
        name == other.name &&
        words == other.words;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, words.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Glossary')
          ..add('id', id)
          ..add('name', name)
          ..add('words', words))
        .toString();
  }
}

class GlossaryBuilder implements Builder<Glossary, GlossaryBuilder> {
  _$Glossary? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<Word>? _words;
  ListBuilder<Word> get words => _$this._words ??= new ListBuilder<Word>();
  set words(ListBuilder<Word>? words) => _$this._words = words;

  GlossaryBuilder() {
    Glossary._defaults(this);
  }

  GlossaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _words = $v.words?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Glossary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Glossary;
  }

  @override
  void update(void Function(GlossaryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Glossary build() => _build();

  _$Glossary _build() {
    _$Glossary _$result;
    try {
      _$result =
          _$v ?? new _$Glossary._(id: id, name: name, words: _words?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'words';
        _words?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Glossary', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
