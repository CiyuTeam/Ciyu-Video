
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dio_provider.dart';

final historyStatusProvider = StateNotifierProvider.family<HistoryNotifier, HistoryStatus, String>(
        (ref, articleId) => HistoryNotifier(ref, articleId));

enum HistoryStatus { initial, loading, success, failure }

class HistoryNotifier extends StateNotifier<HistoryStatus> {
  Ref ref;
  String articleId;

  HistoryNotifier(this.ref, this.articleId) : super(HistoryStatus.initial);

  Future<void> createHistory() async {
    final api = ref.watch(apiProvider);
    state = HistoryStatus.loading;
    try {
      Response response = await api.getHistoryControllerApi().createHistory(articleId: articleId);
      if (response.statusCode == HttpStatus.ok) {
        state = HistoryStatus.success;
      } else {
        state = HistoryStatus.failure;
      }
    } catch (exception) {
      state = HistoryStatus.failure;
    }
  }
}


final historiesProvider =
StateNotifierProvider.autoDispose<HistoriesNotifier, List<SearchHitArticle>>(
        (ref) => HistoriesNotifier(ref));

class HistoriesNotifier extends StateNotifier<List<SearchHitArticle>> {
  final _size = 10;
  int _page = 0;
  final Ref ref;
  bool _loading = false;

  HistoriesNotifier(this.ref) : super([]) {
    fetch();
  }

  Future<void> fetch() async {
    if (_loading) return;
    _loading = true;
    final api = ref.watch(apiProvider);
    Response<SearchHitsArticle> response =
    await api.getHistoryControllerApi().getPaginatedHistories(
      size: _size,
      page: _page,
    );
    if (response.statusCode == HttpStatus.ok &&
        response.data != null &&
        response.data!.searchHits != null) {
      state = [...state, ...response.data!.searchHits!.toList()];
      _page++;
    }
    _loading = false;
  }

  Future<void> reset() {
    state = [];
    _page = 0;
    return fetch();
  }
}