// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_option.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EntryOption extends EntryOption {
  @override
  final String? text;
  @override
  final int? offset;
  @override
  final int? length;
  @override
  final BuiltList<Option>? options;

  factory _$EntryOption([void Function(EntryOptionBuilder)? updates]) =>
      (new EntryOptionBuilder()..update(updates))._build();

  _$EntryOption._({this.text, this.offset, this.length, this.options})
      : super._();

  @override
  EntryOption rebuild(void Function(EntryOptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryOptionBuilder toBuilder() => new EntryOptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryOption &&
        text == other.text &&
        offset == other.offset &&
        length == other.length &&
        options == other.options;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, length.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EntryOption')
          ..add('text', text)
          ..add('offset', offset)
          ..add('length', length)
          ..add('options', options))
        .toString();
  }
}

class EntryOptionBuilder implements Builder<EntryOption, EntryOptionBuilder> {
  _$EntryOption? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _length;
  int? get length => _$this._length;
  set length(int? length) => _$this._length = length;

  ListBuilder<Option>? _options;
  ListBuilder<Option> get options =>
      _$this._options ??= new ListBuilder<Option>();
  set options(ListBuilder<Option>? options) => _$this._options = options;

  EntryOptionBuilder() {
    EntryOption._defaults(this);
  }

  EntryOptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _offset = $v.offset;
      _length = $v.length;
      _options = $v.options?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryOption other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EntryOption;
  }

  @override
  void update(void Function(EntryOptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EntryOption build() => _build();

  _$EntryOption _build() {
    _$EntryOption _$result;
    try {
      _$result = _$v ??
          new _$EntryOption._(
              text: text,
              offset: offset,
              length: length,
              options: _options?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EntryOption', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
