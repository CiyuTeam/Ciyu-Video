// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explanation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Explanation extends Explanation {
  @override
  final bool? match;
  @override
  final double? value;
  @override
  final String? description;
  @override
  final BuiltList<Explanation>? details;

  factory _$Explanation([void Function(ExplanationBuilder)? updates]) =>
      (new ExplanationBuilder()..update(updates))._build();

  _$Explanation._({this.match, this.value, this.description, this.details})
      : super._();

  @override
  Explanation rebuild(void Function(ExplanationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExplanationBuilder toBuilder() => new ExplanationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Explanation &&
        match == other.match &&
        value == other.value &&
        description == other.description &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, match.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Explanation')
          ..add('match', match)
          ..add('value', value)
          ..add('description', description)
          ..add('details', details))
        .toString();
  }
}

class ExplanationBuilder implements Builder<Explanation, ExplanationBuilder> {
  _$Explanation? _$v;

  bool? _match;
  bool? get match => _$this._match;
  set match(bool? match) => _$this._match = match;

  double? _value;
  double? get value => _$this._value;
  set value(double? value) => _$this._value = value;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<Explanation>? _details;
  ListBuilder<Explanation> get details =>
      _$this._details ??= new ListBuilder<Explanation>();
  set details(ListBuilder<Explanation>? details) => _$this._details = details;

  ExplanationBuilder() {
    Explanation._defaults(this);
  }

  ExplanationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _match = $v.match;
      _value = $v.value;
      _description = $v.description;
      _details = $v.details?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Explanation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Explanation;
  }

  @override
  void update(void Function(ExplanationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Explanation build() => _build();

  _$Explanation _build() {
    _$Explanation _$result;
    try {
      _$result = _$v ??
          new _$Explanation._(
              match: match,
              value: value,
              description: description,
              details: _details?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        _details?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Explanation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
