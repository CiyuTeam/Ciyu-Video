import 'package:built_collection/built_collection.dart';
import 'package:ciyu/pages/article_page.dart';
import 'package:ciyu/providers/bond_provider.dart';
import 'package:ciyu/providers/dio_provider.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meet_provider.dart';

final wordProvider =
    FutureProvider.autoDispose.family<WordDto, String>((ref, wordId) async {
  CiyuApi api = ref.watch(apiProvider);
  Response<WordDto> response = await api.getWordControllerApi().getWordById(
    id: wordId,
  );
  ref.read(hasBondProvider(wordId).notifier).setData(response.data!.hasBond!);
  return response.data!;
});


final extractedWordsProvider =
FutureProvider.autoDispose.family<List<WordDto>, String>((ref, task) async {
  CiyuApi api = ref.watch(apiProvider);
  Response<BuiltList<WordDto>> response = await api.getWordControllerApi().extractWordsByTask(
    task: task,
  );
  response.data!.forEach((word) => ref.read(hasBondProvider(word.id!).notifier).setData(word.hasBond!));

  return response.data!.toList();
});

final newlyBondedWordIdsProvider = StateNotifierProvider.autoDispose<NewlyBondedWordIdsNotifier, Map<String, bool>>((ref) => NewlyBondedWordIdsNotifier(ref));

class NewlyBondedWordIdsNotifier extends StateNotifier<Map<String, bool>> {
  Ref ref;
  NewlyBondedWordIdsNotifier(this.ref) : super({});
  void add(String wordId) {
    state[wordId] = true;
    state = Map.from(state);
  }

  void remove(String wordId) {
    state[wordId] = false;
    state = Map.from(state);
  }
}

final offScreenWordIdsProvider = StateNotifierProvider.autoDispose<OffScreenWordIdsNotifier, Set<String>>((ref) => OffScreenWordIdsNotifier(ref));

class OffScreenWordIdsNotifier extends StateNotifier<Set<String>> {
  Ref ref;
  OffScreenWordIdsNotifier(this.ref) : super({});
  bool contains(String wordId) {
    return state.contains(wordId);
  }
  void addAll(Set<String> wordIds) {
    Set<String> delta = wordIds.difference(state);
    if (delta.isNotEmpty) {
      ref.read(meetsStatusProvider.notifier).createMeets(
          wordIds: wordIds.toList(),
          articleId: "");
      wordIds.addAll(delta);
    }
  }
}