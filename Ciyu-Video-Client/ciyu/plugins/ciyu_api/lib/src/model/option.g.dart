// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Option extends Option {
  @override
  final String? text;
  @override
  final String? highlighted;
  @override
  final double? score;
  @override
  final bool? collateMatch;

  factory _$Option([void Function(OptionBuilder)? updates]) =>
      (new OptionBuilder()..update(updates))._build();

  _$Option._({this.text, this.highlighted, this.score, this.collateMatch})
      : super._();

  @override
  Option rebuild(void Function(OptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OptionBuilder toBuilder() => new OptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Option &&
        text == other.text &&
        highlighted == other.highlighted &&
        score == other.score &&
        collateMatch == other.collateMatch;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, highlighted.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, collateMatch.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Option')
          ..add('text', text)
          ..add('highlighted', highlighted)
          ..add('score', score)
          ..add('collateMatch', collateMatch))
        .toString();
  }
}

class OptionBuilder implements Builder<Option, OptionBuilder> {
  _$Option? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _highlighted;
  String? get highlighted => _$this._highlighted;
  set highlighted(String? highlighted) => _$this._highlighted = highlighted;

  double? _score;
  double? get score => _$this._score;
  set score(double? score) => _$this._score = score;

  bool? _collateMatch;
  bool? get collateMatch => _$this._collateMatch;
  set collateMatch(bool? collateMatch) => _$this._collateMatch = collateMatch;

  OptionBuilder() {
    Option._defaults(this);
  }

  OptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _highlighted = $v.highlighted;
      _score = $v.score;
      _collateMatch = $v.collateMatch;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Option other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Option;
  }

  @override
  void update(void Function(OptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Option build() => _build();

  _$Option _build() {
    final _$result = _$v ??
        new _$Option._(
            text: text,
            highlighted: highlighted,
            score: score,
            collateMatch: collateMatch);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
