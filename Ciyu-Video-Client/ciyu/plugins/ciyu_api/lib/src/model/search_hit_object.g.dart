// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hit_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchHitObject extends SearchHitObject {
  @override
  final String? index;
  @override
  final String? id;
  @override
  final double? score;
  @override
  final BuiltList<JsonObject>? sortValues;
  @override
  final JsonObject? content;
  @override
  final BuiltMap<String, BuiltList<String>>? highlightFields;
  @override
  final NestedMetaData? nestedMetaData;
  @override
  final String? routing;
  @override
  final Explanation? explanation;
  @override
  final BuiltList<String>? matchedQueries;

  factory _$SearchHitObject([void Function(SearchHitObjectBuilder)? updates]) =>
      (new SearchHitObjectBuilder()..update(updates))._build();

  _$SearchHitObject._(
      {this.index,
      this.id,
      this.score,
      this.sortValues,
      this.content,
      this.highlightFields,
      this.nestedMetaData,
      this.routing,
      this.explanation,
      this.matchedQueries})
      : super._();

  @override
  SearchHitObject rebuild(void Function(SearchHitObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchHitObjectBuilder toBuilder() =>
      new SearchHitObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchHitObject &&
        index == other.index &&
        id == other.id &&
        score == other.score &&
        sortValues == other.sortValues &&
        content == other.content &&
        highlightFields == other.highlightFields &&
        nestedMetaData == other.nestedMetaData &&
        routing == other.routing &&
        explanation == other.explanation &&
        matchedQueries == other.matchedQueries;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, index.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, sortValues.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, highlightFields.hashCode);
    _$hash = $jc(_$hash, nestedMetaData.hashCode);
    _$hash = $jc(_$hash, routing.hashCode);
    _$hash = $jc(_$hash, explanation.hashCode);
    _$hash = $jc(_$hash, matchedQueries.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchHitObject')
          ..add('index', index)
          ..add('id', id)
          ..add('score', score)
          ..add('sortValues', sortValues)
          ..add('content', content)
          ..add('highlightFields', highlightFields)
          ..add('nestedMetaData', nestedMetaData)
          ..add('routing', routing)
          ..add('explanation', explanation)
          ..add('matchedQueries', matchedQueries))
        .toString();
  }
}

class SearchHitObjectBuilder
    implements Builder<SearchHitObject, SearchHitObjectBuilder> {
  _$SearchHitObject? _$v;

  String? _index;
  String? get index => _$this._index;
  set index(String? index) => _$this._index = index;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  double? _score;
  double? get score => _$this._score;
  set score(double? score) => _$this._score = score;

  ListBuilder<JsonObject>? _sortValues;
  ListBuilder<JsonObject> get sortValues =>
      _$this._sortValues ??= new ListBuilder<JsonObject>();
  set sortValues(ListBuilder<JsonObject>? sortValues) =>
      _$this._sortValues = sortValues;

  JsonObject? _content;
  JsonObject? get content => _$this._content;
  set content(JsonObject? content) => _$this._content = content;

  MapBuilder<String, BuiltList<String>>? _highlightFields;
  MapBuilder<String, BuiltList<String>> get highlightFields =>
      _$this._highlightFields ??= new MapBuilder<String, BuiltList<String>>();
  set highlightFields(MapBuilder<String, BuiltList<String>>? highlightFields) =>
      _$this._highlightFields = highlightFields;

  NestedMetaDataBuilder? _nestedMetaData;
  NestedMetaDataBuilder get nestedMetaData =>
      _$this._nestedMetaData ??= new NestedMetaDataBuilder();
  set nestedMetaData(NestedMetaDataBuilder? nestedMetaData) =>
      _$this._nestedMetaData = nestedMetaData;

  String? _routing;
  String? get routing => _$this._routing;
  set routing(String? routing) => _$this._routing = routing;

  ExplanationBuilder? _explanation;
  ExplanationBuilder get explanation =>
      _$this._explanation ??= new ExplanationBuilder();
  set explanation(ExplanationBuilder? explanation) =>
      _$this._explanation = explanation;

  ListBuilder<String>? _matchedQueries;
  ListBuilder<String> get matchedQueries =>
      _$this._matchedQueries ??= new ListBuilder<String>();
  set matchedQueries(ListBuilder<String>? matchedQueries) =>
      _$this._matchedQueries = matchedQueries;

  SearchHitObjectBuilder() {
    SearchHitObject._defaults(this);
  }

  SearchHitObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _index = $v.index;
      _id = $v.id;
      _score = $v.score;
      _sortValues = $v.sortValues?.toBuilder();
      _content = $v.content;
      _highlightFields = $v.highlightFields?.toBuilder();
      _nestedMetaData = $v.nestedMetaData?.toBuilder();
      _routing = $v.routing;
      _explanation = $v.explanation?.toBuilder();
      _matchedQueries = $v.matchedQueries?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchHitObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchHitObject;
  }

  @override
  void update(void Function(SearchHitObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchHitObject build() => _build();

  _$SearchHitObject _build() {
    _$SearchHitObject _$result;
    try {
      _$result = _$v ??
          new _$SearchHitObject._(
              index: index,
              id: id,
              score: score,
              sortValues: _sortValues?.build(),
              content: content,
              highlightFields: _highlightFields?.build(),
              nestedMetaData: _nestedMetaData?.build(),
              routing: routing,
              explanation: _explanation?.build(),
              matchedQueries: _matchedQueries?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sortValues';
        _sortValues?.build();

        _$failedField = 'highlightFields';
        _highlightFields?.build();
        _$failedField = 'nestedMetaData';
        _nestedMetaData?.build();

        _$failedField = 'explanation';
        _explanation?.build();
        _$failedField = 'matchedQueries';
        _matchedQueries?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchHitObject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
