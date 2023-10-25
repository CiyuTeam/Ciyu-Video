// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hits_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SearchHitsObjectTotalHitsRelationEnum
    _$searchHitsObjectTotalHitsRelationEnum_EQUAL_TO =
    const SearchHitsObjectTotalHitsRelationEnum._('EQUAL_TO');
const SearchHitsObjectTotalHitsRelationEnum
    _$searchHitsObjectTotalHitsRelationEnum_GREATER_THAN_OR_EQUAL_TO =
    const SearchHitsObjectTotalHitsRelationEnum._('GREATER_THAN_OR_EQUAL_TO');
const SearchHitsObjectTotalHitsRelationEnum
    _$searchHitsObjectTotalHitsRelationEnum_OFF =
    const SearchHitsObjectTotalHitsRelationEnum._('OFF');

SearchHitsObjectTotalHitsRelationEnum
    _$searchHitsObjectTotalHitsRelationEnumValueOf(String name) {
  switch (name) {
    case 'EQUAL_TO':
      return _$searchHitsObjectTotalHitsRelationEnum_EQUAL_TO;
    case 'GREATER_THAN_OR_EQUAL_TO':
      return _$searchHitsObjectTotalHitsRelationEnum_GREATER_THAN_OR_EQUAL_TO;
    case 'OFF':
      return _$searchHitsObjectTotalHitsRelationEnum_OFF;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SearchHitsObjectTotalHitsRelationEnum>
    _$searchHitsObjectTotalHitsRelationEnumValues =
    new BuiltSet<SearchHitsObjectTotalHitsRelationEnum>(const <
        SearchHitsObjectTotalHitsRelationEnum>[
  _$searchHitsObjectTotalHitsRelationEnum_EQUAL_TO,
  _$searchHitsObjectTotalHitsRelationEnum_GREATER_THAN_OR_EQUAL_TO,
  _$searchHitsObjectTotalHitsRelationEnum_OFF,
]);

Serializer<SearchHitsObjectTotalHitsRelationEnum>
    _$searchHitsObjectTotalHitsRelationEnumSerializer =
    new _$SearchHitsObjectTotalHitsRelationEnumSerializer();

class _$SearchHitsObjectTotalHitsRelationEnumSerializer
    implements PrimitiveSerializer<SearchHitsObjectTotalHitsRelationEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'EQUAL_TO': 'EQUAL_TO',
    'GREATER_THAN_OR_EQUAL_TO': 'GREATER_THAN_OR_EQUAL_TO',
    'OFF': 'OFF',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'EQUAL_TO': 'EQUAL_TO',
    'GREATER_THAN_OR_EQUAL_TO': 'GREATER_THAN_OR_EQUAL_TO',
    'OFF': 'OFF',
  };

  @override
  final Iterable<Type> types = const <Type>[
    SearchHitsObjectTotalHitsRelationEnum
  ];
  @override
  final String wireName = 'SearchHitsObjectTotalHitsRelationEnum';

  @override
  Object serialize(
          Serializers serializers, SearchHitsObjectTotalHitsRelationEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SearchHitsObjectTotalHitsRelationEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SearchHitsObjectTotalHitsRelationEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SearchHitsObject extends SearchHitsObject {
  @override
  final BuiltList<SearchHitObject>? searchHits;
  @override
  final SearchHitsObjectTotalHitsRelationEnum? totalHitsRelation;
  @override
  final JsonObject? aggregations;
  @override
  final int? totalHits;
  @override
  final Suggest? suggest;
  @override
  final double? maxScore;
  @override
  final bool? empty;

  factory _$SearchHitsObject(
          [void Function(SearchHitsObjectBuilder)? updates]) =>
      (new SearchHitsObjectBuilder()..update(updates))._build();

  _$SearchHitsObject._(
      {this.searchHits,
      this.totalHitsRelation,
      this.aggregations,
      this.totalHits,
      this.suggest,
      this.maxScore,
      this.empty})
      : super._();

  @override
  SearchHitsObject rebuild(void Function(SearchHitsObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchHitsObjectBuilder toBuilder() =>
      new SearchHitsObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchHitsObject &&
        searchHits == other.searchHits &&
        totalHitsRelation == other.totalHitsRelation &&
        aggregations == other.aggregations &&
        totalHits == other.totalHits &&
        suggest == other.suggest &&
        maxScore == other.maxScore &&
        empty == other.empty;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, searchHits.hashCode);
    _$hash = $jc(_$hash, totalHitsRelation.hashCode);
    _$hash = $jc(_$hash, aggregations.hashCode);
    _$hash = $jc(_$hash, totalHits.hashCode);
    _$hash = $jc(_$hash, suggest.hashCode);
    _$hash = $jc(_$hash, maxScore.hashCode);
    _$hash = $jc(_$hash, empty.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchHitsObject')
          ..add('searchHits', searchHits)
          ..add('totalHitsRelation', totalHitsRelation)
          ..add('aggregations', aggregations)
          ..add('totalHits', totalHits)
          ..add('suggest', suggest)
          ..add('maxScore', maxScore)
          ..add('empty', empty))
        .toString();
  }
}

class SearchHitsObjectBuilder
    implements Builder<SearchHitsObject, SearchHitsObjectBuilder> {
  _$SearchHitsObject? _$v;

  ListBuilder<SearchHitObject>? _searchHits;
  ListBuilder<SearchHitObject> get searchHits =>
      _$this._searchHits ??= new ListBuilder<SearchHitObject>();
  set searchHits(ListBuilder<SearchHitObject>? searchHits) =>
      _$this._searchHits = searchHits;

  SearchHitsObjectTotalHitsRelationEnum? _totalHitsRelation;
  SearchHitsObjectTotalHitsRelationEnum? get totalHitsRelation =>
      _$this._totalHitsRelation;
  set totalHitsRelation(
          SearchHitsObjectTotalHitsRelationEnum? totalHitsRelation) =>
      _$this._totalHitsRelation = totalHitsRelation;

  JsonObject? _aggregations;
  JsonObject? get aggregations => _$this._aggregations;
  set aggregations(JsonObject? aggregations) =>
      _$this._aggregations = aggregations;

  int? _totalHits;
  int? get totalHits => _$this._totalHits;
  set totalHits(int? totalHits) => _$this._totalHits = totalHits;

  SuggestBuilder? _suggest;
  SuggestBuilder get suggest => _$this._suggest ??= new SuggestBuilder();
  set suggest(SuggestBuilder? suggest) => _$this._suggest = suggest;

  double? _maxScore;
  double? get maxScore => _$this._maxScore;
  set maxScore(double? maxScore) => _$this._maxScore = maxScore;

  bool? _empty;
  bool? get empty => _$this._empty;
  set empty(bool? empty) => _$this._empty = empty;

  SearchHitsObjectBuilder() {
    SearchHitsObject._defaults(this);
  }

  SearchHitsObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _searchHits = $v.searchHits?.toBuilder();
      _totalHitsRelation = $v.totalHitsRelation;
      _aggregations = $v.aggregations;
      _totalHits = $v.totalHits;
      _suggest = $v.suggest?.toBuilder();
      _maxScore = $v.maxScore;
      _empty = $v.empty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchHitsObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchHitsObject;
  }

  @override
  void update(void Function(SearchHitsObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchHitsObject build() => _build();

  _$SearchHitsObject _build() {
    _$SearchHitsObject _$result;
    try {
      _$result = _$v ??
          new _$SearchHitsObject._(
              searchHits: _searchHits?.build(),
              totalHitsRelation: totalHitsRelation,
              aggregations: aggregations,
              totalHits: totalHits,
              suggest: _suggest?.build(),
              maxScore: maxScore,
              empty: empty);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'searchHits';
        _searchHits?.build();

        _$failedField = 'suggest';
        _suggest?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchHitsObject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
