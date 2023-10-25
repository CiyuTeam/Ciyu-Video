// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Suggest extends Suggest {
  @override
  final BuiltList<SuggestionEntryOption>? suggestions;

  factory _$Suggest([void Function(SuggestBuilder)? updates]) =>
      (new SuggestBuilder()..update(updates))._build();

  _$Suggest._({this.suggestions}) : super._();

  @override
  Suggest rebuild(void Function(SuggestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuggestBuilder toBuilder() => new SuggestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Suggest && suggestions == other.suggestions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, suggestions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Suggest')
          ..add('suggestions', suggestions))
        .toString();
  }
}

class SuggestBuilder implements Builder<Suggest, SuggestBuilder> {
  _$Suggest? _$v;

  ListBuilder<SuggestionEntryOption>? _suggestions;
  ListBuilder<SuggestionEntryOption> get suggestions =>
      _$this._suggestions ??= new ListBuilder<SuggestionEntryOption>();
  set suggestions(ListBuilder<SuggestionEntryOption>? suggestions) =>
      _$this._suggestions = suggestions;

  SuggestBuilder() {
    Suggest._defaults(this);
  }

  SuggestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _suggestions = $v.suggestions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Suggest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Suggest;
  }

  @override
  void update(void Function(SuggestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Suggest build() => _build();

  _$Suggest _build() {
    _$Suggest _$result;
    try {
      _$result = _$v ?? new _$Suggest._(suggestions: _suggestions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'suggestions';
        _suggestions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Suggest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
