// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_entry_option.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SuggestionEntryOption extends SuggestionEntryOption {
  @override
  final String? name;
  @override
  final int? size;
  @override
  final BuiltList<EntryOption>? entries;

  factory _$SuggestionEntryOption(
          [void Function(SuggestionEntryOptionBuilder)? updates]) =>
      (new SuggestionEntryOptionBuilder()..update(updates))._build();

  _$SuggestionEntryOption._({this.name, this.size, this.entries}) : super._();

  @override
  SuggestionEntryOption rebuild(
          void Function(SuggestionEntryOptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuggestionEntryOptionBuilder toBuilder() =>
      new SuggestionEntryOptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuggestionEntryOption &&
        name == other.name &&
        size == other.size &&
        entries == other.entries;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, entries.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SuggestionEntryOption')
          ..add('name', name)
          ..add('size', size)
          ..add('entries', entries))
        .toString();
  }
}

class SuggestionEntryOptionBuilder
    implements Builder<SuggestionEntryOption, SuggestionEntryOptionBuilder> {
  _$SuggestionEntryOption? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  ListBuilder<EntryOption>? _entries;
  ListBuilder<EntryOption> get entries =>
      _$this._entries ??= new ListBuilder<EntryOption>();
  set entries(ListBuilder<EntryOption>? entries) => _$this._entries = entries;

  SuggestionEntryOptionBuilder() {
    SuggestionEntryOption._defaults(this);
  }

  SuggestionEntryOptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _size = $v.size;
      _entries = $v.entries?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SuggestionEntryOption other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SuggestionEntryOption;
  }

  @override
  void update(void Function(SuggestionEntryOptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SuggestionEntryOption build() => _build();

  _$SuggestionEntryOption _build() {
    _$SuggestionEntryOption _$result;
    try {
      _$result = _$v ??
          new _$SuggestionEntryOption._(
              name: name, size: size, entries: _entries?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entries';
        _entries?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SuggestionEntryOption', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
