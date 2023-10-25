import 'package:audioplayers/audioplayers.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:ciyu/widgets/writing_hand_animation.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/bond_provider.dart';
import '../providers/meet_provider.dart';
import '../providers/word_provider.dart';
import '../styles/theme.dart';

final refreshKey = GlobalKey();

class WordSheet extends HookConsumerWidget {
  final String wordId;
  final String articleId;
  final String task;

  const WordSheet(
      {required this.wordId,
      required this.task,
      required this.articleId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<WordDto>> words = ref.watch(extractedWordsProvider(task));
    AsyncValue<WordDto> word = ref.watch(wordProvider(wordId));
    useEffect(() {
      void refresh() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final currentState = refreshKey.currentState;
          if (currentState != null) {
            currentState.setState(() {});
          }
        });
      }

      if (word is AsyncData) {
        refresh();
      }
      if (words is AsyncData) {
        refresh();
      }
      return () {
        // 清理代码（例如取消订阅）可以放在这里
      };
    }, [word, words]);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: DefaultTabController(
              length: words is AsyncData ? words.value!.length + 1 : 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: _buildHintTabBar(wordId, task)),
                        _buildAddBond(wordId),
                      ],
                    ),
                  ),
                  _buildHintTabBarView(wordId, task),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Consumer _buildAddBond(String wordId) {
    return Consumer(
      builder: (context, ref, child) {
        final isBonded = ref.watch(isBondedProvider(wordId));
        AsyncValue<WordDto> word = ref.watch(wordProvider(wordId));
        final hasBondNotifier = ref.read(hasBondProvider(wordId).notifier);
        return IconButton(
          onPressed: () {
            if (isBonded)
              hasBondNotifier.removeBond(wordId: wordId);
            else
              hasBondNotifier.createBond(
                articleId: articleId,
                meaningId: word.value!.meanings![0].id!,
                quality: 1,
              );
          },
          icon: isBonded
              ? Icon(Icons.bookmark)
              : Icon(Icons.bookmark_add_outlined),
        );
      },
    );
  }

  Widget _buildHintTabBarView(String wordId, String task) {
    return Consumer(builder: (context, ref, child) {
      AsyncValue<WordDto> word = ref.watch(wordProvider(wordId));
      AsyncValue<List<WordDto>> words = ref.watch(extractedWordsProvider(task));
      bool? hasBond = ref.watch(hasBondProvider(wordId));
      ref.listen(meetStatusProvider, (previous, next) {
        if (next == MeetStatus.success) Navigator.pop(context);
      });
      return SingleChildScrollView(
        child: AutoScaleTabBarView(key: refreshKey, children: [
          Container(
            width: double.infinity,
            child: word.when(
              data: (data) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPhonetic(data),
                    SizedBox(height: 12),
                    SingleChildScrollView(
                      child: _buildMeanings(data.meanings!.toList()),
                    ),
                    if (hasBond != null && hasBond && word is AsyncData)
                      _buildQuality(word.value!),
                  ],
                );
              },
              error: (error, stackTrace) => Text("查询失败"),
              loading: () => Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox.square(
                    dimension: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
            ),
          ),
          if (words is AsyncData)
            ...words.value!.map(
              (word) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMeanings(word.meanings!.toList()),
                  _buildQuality(word),
                ],
              ),
            )
        ]),
      );
    });
  }

  Widget _buildPhonetic(WordDto word) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0x1e767680),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.separated(
          itemCount: word.phonetics!.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => Opacity(
                opacity: 0.30,
                child: Container(
                  width: 20,
                  child: VerticalDivider(
                    color: Color(0xff8e8e93),
                    // width: 1,
                    thickness: 1,
                  ),
                ),
              ),
          itemBuilder: (context, index) {
            Phonetic phonetic = word.phonetics![index];
            return GestureDetector(
              onTap: () => AudioPlayer().play(UrlSource(phonetic.audio!)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    phonetic.locale!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "SF Pro Text",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    phonetic.symbol!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "SF Pro Text",
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _buildQuality(WordDto word) {
    List<String> descriptions = <String>["忘记", "猜错", "猜对", "记得", "掌握"];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 12),
        Row(
          children: List.generate(
            5,
            (index) {
              int score = index + 1;
              double quality = score / 5.0;
              return Expanded(
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) =>
                          GestureDetector(
                    onTap: () {
                      ref.read(meetStatusProvider.notifier).createMeet(
                            wordId: word.id!,
                            articleId: articleId,
                            meaningId: word.meanings!.first.id!,
                            quality: quality,
                          );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0x1e767680),
                      ),
                      padding: const EdgeInsets.all(6),
                      margin: EdgeInsets.fromLTRB(index > 0 ? 4 : 0, 0, 0, 0),
                      child: Center(
                          child: Text(
                        "${descriptions[index]}",
                        style:
                            textTheme.bodySmall!.copyWith(fontFamily: 'FZXBS'),
                      )),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHintTabBar(String wordId, String task) {

    return Consumer(
      builder: (context, ref, child) {
        AsyncValue<List<WordDto>> words =
            ref.watch(extractedWordsProvider(task));
        Widget tabBar = TabBar(
          indicatorPadding: EdgeInsets.symmetric(vertical: 10),
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
          physics: BouncingScrollPhysics(),
          isScrollable: true,
          tabs: [
            DefaultTextStyle(
              style: textTheme.titleMedium!,
              child: Tab(text: wordId),
            ),
            if (words is AsyncData)
              ...words.value!.map((word) => DefaultTextStyle(
                style: textTheme.titleMedium!,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Tab(text: word.id),
                    Positioned(
                      top: 4,
                      right: -8,
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                        ),
                        child: Text(
                          "AI",
                          style: TextStyle(
                            fontFamily: '',
                            color: Colors.white,
                            fontSize: 6,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
          ],
        );
        if (words is AsyncLoading)
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              tabBar,
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: WritingHandAnimation(),
              ),
            ],
          );
        else
          return tabBar;
      },
    );
  }

  Widget _buildMeanings(List<Meaning> meanings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: meanings
          .map((meaning) => Text(
                meaning.definition!,
                style: textTheme.bodySmall!.copyWith(fontFamily: 'FZXBS'),
              ))
          .toList(),
    );
  }
}
