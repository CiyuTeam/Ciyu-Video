import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:built_collection/src/list.dart';
import 'package:ciyu/models/article_word.dart';
import 'package:ciyu/providers/article_provider.dart';
import 'package:ciyu/providers/bond_provider.dart';
import 'package:ciyu/providers/history_provider.dart';
import 'package:ciyu/providers/meet_provider.dart';
import 'package:ciyu/providers/word_provider.dart';
import 'package:ciyu/styles/theme.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:ciyu_api/src/model/article.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../styles/custom_colors.dart';
import '../widgets/word_sheet.dart';

class ArticlePage extends StatefulHookConsumerWidget {
  final SearchHitArticle article;
  Set<String> _highlightWordIds = {};

  @override
  ArticlePage(this.article, {Key? key}) : super(key: key) {
    _highlightWordIds = RegExp("<em>([a-zA-Z-']+)</em>")
        .allMatches((article.highlightFields!["title"] == null
                ? " "
                : article.highlightFields!["title"]![0]) +
            (article.highlightFields!["content"] == null
                ? " "
                : article.highlightFields!["content"]![0]))
        .map((match) => match.group(1)!)
        .toSet();
  }

  static Route route(SearchHitArticle article) {
    return MaterialPageRoute<void>(builder: (_) => ArticlePage(article));
  }

  _ArticlePageState createState() => _ArticlePageState();
}

double kExpandedHeight = 200;

class _ArticlePageState extends ConsumerState<ArticlePage>
    with SingleTickerProviderStateMixin {
  double _fontSize = 20;
  double _textHeight = 1.5;

  @override
  Widget build(BuildContext context) {
    ColorChoice colorChoice = ref.watch(articleColorChoiceProvider);
    ref.watch(newlyBondedWordIdsProvider);
    ref
        .read(historyStatusProvider(widget.article.id!).notifier)
        .createHistory();
    widget._highlightWordIds.forEach((wordId) => Future.microtask(
        () => ref.read(hasHighlightProvider(wordId).notifier).state = true));

    return Scaffold(
      backgroundColor: colorChoice.backgroundColor,
      body: _buildBody(),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: _buildSetting,
    );
  }

  void _showWordSheet(String wordId, String task) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        builder: (context) {
          return WordSheet(
            wordId: wordId,
            task: task,
            articleId: widget.article.id!,
          );
        });
  }

  Widget _buildBody() {
    List<String> unmarkedWordIds = widget._highlightWordIds
        .where((wordId) => !ref.watch(isMetProvider(wordId)))
        .toList();
    return CustomScrollView(
        controller: useScrollController(),
        physics: const BouncingScrollPhysics(), //反弹效果
        slivers: <Widget>[
          SliverAppBar(
            // title: Text("hello"),
            actions: <Widget>[
              IconButton(onPressed: null, icon: Icon(Icons.favorite)),
              IconButton(
                  icon: Icon(Icons.settings), onPressed: _showModalBottomSheet),
            ],
            floating: true,
          ),
          SliverPadding(
            padding: EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildTitle(widget.article.highlightFields!.containsKey("title")
                    ? widget.article.highlightFields!["title"]![0]
                    : widget.article.content!.title!),
                SizedBox(height: 20),
                _buildContent(
                    widget.article.highlightFields!.containsKey("content")
                        ? widget.article.highlightFields!["content"]![0]
                        : widget.article.content!.content!),
                SizedBox(height: 20),
                if (unmarkedWordIds.isNotEmpty)
                  _buildUnmarkedWords(unmarkedWordIds)
              ]),
            ),
          ),
        ]);
  }

  Container _buildUnmarkedWords(List<String> unmarkedWordIds) {
    MeetsStatus meetsStatus = ref.watch(meetsStatusProvider);

    return meetsStatus == MeetsStatus.success
        ? Container()
        : Container(
            decoration: BoxDecoration(
              color: const Color(0xfff9f9f9),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "掌握情况未知的规划词",
                      style: textTheme.titleSmall,
                    ),
                    SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        children: unmarkedWordIds
                            .map((wordId) => TextSpan(
                                  text: wordId,
                                  style: textTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => _showWordSheet(wordId, ""),
                                ))
                            .fold<List<TextSpan>>([], (previousValue, element) {
                          if (previousValue.isEmpty) {
                            return [element];
                          } else {
                            return [
                              ...previousValue,
                              TextSpan(
                                text: ", ",
                                style: textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              element,
                            ];
                          }
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                meetsStatus == MeetsStatus.loading
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(strokeWidth: 3)),
                      )
                    : TextButton.icon(
                        onPressed: () {
                          ref.read(meetsStatusProvider.notifier).createMeets(
                              wordIds: unmarkedWordIds,
                              articleId: widget.article.id!);
                        },
                        label: Text("一键标记认识"),
                        icon: Icon(Icons.done_all),
                      ),
              ],
            ),
          );
  }

  Widget _buildClickableText(String content, TextStyle style) {
    ColorChoice colorChoice = ref.watch(articleColorChoiceProvider);
    return EasyRichText(
      content,
      defaultStyle: style,
      selectable: true,
      patternList: [
        EasyRichTextPattern(
          targetString: r"(<em>)?([a-zA-Z-']+)(</em>)?",
          matchBuilder: (BuildContext context, RegExpMatch? match,
              [int? wordStart, int? wordEnd]) {
            String wordId = match![2]!;
            int startIndex = wordStart! > 100 ? wordStart - 100 : 0;
            int endIndex = startIndex + 200 < content.length
                ? startIndex + 200
                : content.length;

            String contextBeforeWord = content.substring(startIndex, wordStart);
            String contextAfterWord = content.substring(wordEnd!, endIndex);

            String task = '$contextBeforeWord[$wordId]$contextAfterWord'
                .replaceAll("<em>", "")
                .replaceAll("</em>", "");

            // print("word: $wordId, startIndex: $startIndex, wordStart: ${wordStart}, wordEnd: ${wordEnd}, endIndex: $endIndex, task: $task");
            bool hasHighlight = match[1] != null;

            bool? newlyBondedStatus =
                ref.watch(newlyBondedStatusProvider(wordId));
            return TextSpan(
              text: wordId,
              style: TextStyle(
                  color: newlyBondedStatus ?? hasHighlight
                      ? Colors.blue
                      : colorChoice.foregroundColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _showWordSheet(wordId, task);
                },
            );
          },
        ),
      ],
    );
  }

  Widget _buildTitle(String text) {
    return _buildClickableText(text, textTheme.displaySmall!);
  }

  Widget _buildContent(String content) {
    TextStyle contentStyle =
        textTheme.bodyLarge!.copyWith(fontFamily: 'Times New Roman');
    return _buildClickableText(content, contentStyle);
  }

  List<ArticleWord> extractWords(String content) {
    return RegExp("[a-zA-Z-']+")
        .allMatches(content)
        .map((element) => ArticleWord(
              text: element.group(0)!,
              color: Colors.black,
              start: element.start,
              end: element.end,
            ))
        .toList();
  }

  Widget _buildSetting(BuildContext context) {
    List<ColorChoice> colorCandidates =
        ref.watch(articleColorCandidatesProvider);
    var circles = colorCandidates
        .map((colorCandidate) => GestureDetector(
              onTap: () {
                ref.read(articleColorChoiceProvider.notifier).state =
                    colorCandidate;
              },
              child: Consumer(builder: (context, ref, child) {
                ColorChoice colorChoice = ref.watch(articleColorChoiceProvider);
                return Container(
                  width: 60,
                  height: 60,
                  decoration: colorCandidate == colorChoice
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: CustomColors.vi),
                        )
                      : null,
                  child: Center(
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: colorCandidate.backgroundColor,
                    ),
                  ),
                );
              }),
            ))
        .toList();

    return Padding(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: circles,
            ),
            SizedBox(height: 16.0),
            Divider(color: CustomColors.lightGrey),
            SizedBox(height: 16.0),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset('svgs/text_size_small.svg',
                        color: CustomColors.grey),
                    onTap: () {
                      print("small");
                      setState(() {
                        _fontSize = 16.0;
                      });
                    },
                  ),
                  GestureDetector(
                    child: SvgPicture.asset('svgs/text_size_medium.svg',
                        color: CustomColors.black),
                    onTap: () {
                      print("medium");
                      setState(() {
                        _fontSize = 20.0;
                      });
                    },
                  ),
                  GestureDetector(
                    child: SvgPicture.asset('svgs/text_size_large.svg',
                        color: CustomColors.grey),
                    onTap: () {
                      print("large");
                      setState(() {
                        _fontSize = 24.0;
                      });
                    },
                  ),
                  VerticalDivider(
                    color: CustomColors.lightGrey,
                    thickness: 0.7,
                  ),
                  GestureDetector(
                    child: SvgPicture.asset('svgs/line_spacing_small.svg',
                        color: CustomColors.grey),
                    onTap: () {
                      setState(() {
                        _textHeight = 1.2;
                      });
                    },
                  ),
                  GestureDetector(
                    child: SvgPicture.asset('svgs/line_spacing_medium.svg',
                        color: CustomColors.black),
                    onTap: () {
                      setState(() {
                        _textHeight = 1.5;
                      });
                    },
                  ),
                  GestureDetector(
                    child: SvgPicture.asset('svgs/line_spacing_large.svg',
                        color: CustomColors.grey),
                    onTap: () {
                      setState(() {
                        _textHeight = 1.8;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
