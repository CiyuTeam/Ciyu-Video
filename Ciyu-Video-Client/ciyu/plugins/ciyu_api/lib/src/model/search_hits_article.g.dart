// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hits_article.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SearchHitsArticleTotalHitsRelationEnum
    _$searchHitsArticleTotalHitsRelationEnum_EQUAL_TO =
    const SearchHitsArticleTotalHitsRelationEnum._('EQUAL_TO');
const SearchHitsArticleTotalHitsRelationEnum
    _$searchHitsArticleTotalHitsRelationEnum_GREATER_THAN_OR_EQUAL_TO =
    const SearchHitsArticleTotalHitsRelationEnum._('GREATER_THAN_OR_EQUAL_TO');
const SearchHitsArticleTotalHitsRelationEnum
    _$searchHitsArticleTotalHitsRelationEnum_OFF =
    const SearchHitsArticleTotalHitsRelationEnum._('OFF');

SearchHitsArticleTotalHitsRelationEnum
    _$searchHitsArticleTotalHitsRelationEnumValueOf(String name) {
  switch (name) {
    case 'EQUAL_TO':
      return _$searchHitsArticleTotalHitsRelationEnum_EQUAL_TO;
    case 'GREATER_THAN_OR_EQUAL_TO':
      return _$searchHitsArticleTotalHitsRelationEnum_GREATER_THAN_OR_EQUAL_TO;
    case 'OFF':
      return _$searchHitsArticleTotalHitsRelationEnum_OFF;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SearchHitsArticleTotalHitsRelationEnum>
    _$searchHitsArticleTotalHitsRelationEnumValues =
    new BuiltSet<SearchHitsArticleTotalHitsRelationEnum>(const <
        SearchHitsArticleTotalHitsRelationEnum>[
  _$searchHitsArticleTotalHitsRelationEnum_EQUAL_TO,
  _$searchHitsArticleTotalHitsRelationEnum_GREATER_THAN_OR_EQUAL_TO,
  _$searchHitsArticleTotalHitsRelationEnum_OFF,
]);

Serializer<SearchHitsArticleTotalHitsRelationEnum>
    _$searchHitsArticleTotalHitsRelationEnumSerializer =
    new _$SearchHitsArticleTotalHitsRelationEnumSerializer();

class _$SearchHitsArticleTotalHitsRelationEnumSerializer
    implements PrimitiveSerializer<SearchHitsArticleTotalHitsRelationEnum> {
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
    SearchHitsArticleTotalHitsRelationEnum
  ];
  @override
  final String wireName = 'SearchHitsArticleTotalHitsRelationEnum';

  @override
  Object serialize(Serializers serializers,
          SearchHitsArticleTotalHitsRelationEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SearchHitsArticleTotalHitsRelationEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SearchHitsArticleTotalHitsRelationEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SearchHitsArticle extends SearchHitsArticle {
  @override
  final BuiltList<SearchHitArticle>? searchHits;
  @override
  final SearchHitsArticleTotalHitsRelationEnum? totalHitsRelation;
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

  factory _$SearchHitsArticle(
          [void Function(SearchHitsArticleBuilder)? updates]) =>
      (new SearchHitsArticleBuilder()..update(updates))._build();

  _$SearchHitsArticle._(
      {this.searchHits,
      this.totalHitsRelation,
      this.aggregations,
      this.totalHits,
      this.suggest,
      this.maxScore,
      this.empty})
      : super._();

  @override
  SearchHitsArticle rebuild(void Function(SearchHitsArticleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchHitsArticleBuilder toBuilder() =>
      new SearchHitsArticleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchHitsArticle &&
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
    return (newBuiltValueToStringHelper(r'SearchHitsArticle')
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

class SearchHitsArticleBuilder
    implements Builder<SearchHitsArticle, SearchHitsArticleBuilder> {
  _$SearchHitsArticle? _$v;

  ListBuilder<SearchHitArticle>? _searchHits;
  ListBuilder<SearchHitArticle> get searchHits =>
      _$this._searchHits ??= new ListBuilder<SearchHitArticle>();
  set searchHits(ListBuilder<SearchHitArticle>? searchHits) =>
      _$this._searchHits = searchHits;

  SearchHitsArticleTotalHitsRelationEnum? _totalHitsRelation;
  SearchHitsArticleTotalHitsRelationEnum? get totalHitsRelation =>
      _$this._totalHitsRelation;
  set totalHitsRelation(
          SearchHitsArticleTotalHitsRelationEnum? totalHitsRelation) =>
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

  SearchHitsArticleBuilder() {
    SearchHitsArticle._defaults(this);
  }

  SearchHitsArticleBuilder get _$this {
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
  void replace(SearchHitsArticle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchHitsArticle;
  }

  @override
  void update(void Function(SearchHitsArticleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchHitsArticle build() => _build();

  _$SearchHitsArticle _build() {
    _$SearchHitsArticle _$result;
    try {
      _$result = _$v ??
          new _$SearchHitsArticle._(
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
            r'SearchHitsArticle', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
