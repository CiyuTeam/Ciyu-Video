import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:ciyu/providers/dio_provider.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../styles/custom_colors.dart';

final completionProvider =
    StateNotifierProvider.autoDispose<CompletionNotifier, String>(
        (ref) => CompletionNotifier(ref));

class CompletionNotifier extends StateNotifier<String> {
  final _size = 10;
  final Ref ref;
  bool _loading = false;

  CompletionNotifier(this.ref) : super("") {
    fetch();
  }

  Future<void> fetch() async {
    if (_loading) return;
    _loading = true;
    final api = ref.watch(apiProvider);
    List<String> excludedWordIds = [];
    Response<String> response =
        await api.getSentenceControllerApi().generateCompletions(
              size: _size,
              page: 0,
              beforeText: state.replaceAll("<em>", "").replaceAll("</em>", ""),
              excludedWordIds: excludedWordIds.length > 0
                  ? BuiltList.of(excludedWordIds)
                  : BuiltList.of([""]),
            );
    if (response.statusCode == HttpStatus.ok &&
        response.data != null) {
      state = "$state\n${response.data!}";
    }
    _loading = false;
  }

  Future<void> reset() {
    state = "";
    return fetch();
  }

}
