import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:ciyu/providers/dio_provider.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ciyu/providers/bond_provider.dart';

final meetStatusProvider = StateNotifierProvider.autoDispose<MeetNotifier, MeetStatus>(
        (ref) => MeetNotifier(ref));

final meetsStatusProvider = StateNotifierProvider.autoDispose<MeetsNotifier, MeetsStatus>(
        (ref) => MeetsNotifier(ref));

enum MeetStatus { initial, loading, success, failure }

enum MeetsStatus { initial, loading, success, failure }

class MeetNotifier extends StateNotifier<MeetStatus> {
  Ref ref;

  MeetNotifier(this.ref) : super(MeetStatus.initial);

  Future<void> createMeet({
    required String wordId,
    required String articleId,
    required String meaningId,
    required double quality,
  }) async {
    final api = ref.watch(apiProvider);
    state = MeetStatus.loading;
    try {
      Response response = await api.getMeetControllerApi().createMeet(
        createMeetDto: CreateMeetDto((createMeetBuilder) => createMeetBuilder
          ..articleId = articleId
          ..meaningId = meaningId
          ..quality = quality),
        extra: <String, List<Map<String, String>>>{
          "secure": [
            <String, String>{
              "type": "http",
              "scheme": "bearer",
              "name": "jwt",
            },
          ]
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        state = MeetStatus.success;
        ref.read(isMetProvider(wordId).notifier).state = true;
      } else {
        state = MeetStatus.failure;
      }
    } catch (exception) {
      state = MeetStatus.failure;
    }
  }
}

class MeetsNotifier extends StateNotifier<MeetsStatus> {
  Ref ref;

  MeetsNotifier(this.ref) : super(MeetsStatus.initial);


  Future<void> createMeets({
    required List<String> wordIds,
    required String articleId,
  }) async {
    final api = ref.watch(apiProvider);
    state = MeetsStatus.loading;
    try {
      Response response = await api.getMeetControllerApi().createMeets(
        createMeetsDto: CreateMeetsDto((createMeetsBuilder) => createMeetsBuilder
          ..articleId = articleId
          ..wordIds.addAll(wordIds)),
        extra: <String, List<Map<String, String>>>{
          "secure": [
            <String, String>{
              "type": "http",
              "scheme": "bearer",
              "name": "jwt",
            },
          ]
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        state = MeetsStatus.success;
        wordIds.forEach((wordId) => ref.read(isMetProvider(wordId).notifier).state = true);

      } else {
        state = MeetsStatus.failure;
      }
    } catch (exception) {
      state = MeetsStatus.failure;
    }
  }
}



final meetsProvider = FutureProvider.autoDispose.family<List<MeetDto>, String>((ref, wordId) async {
  CiyuApi api = ref.watch(apiProvider);
  Response<BuiltList<MeetDto>> response = await api.getMeetControllerApi().getMeets(
    wordId: wordId,
  );
  return response.data!.toList()..sort(
          (a, b) => a.createdTime!.compareTo(b.createdTime!));
});