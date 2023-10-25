import 'package:ciyu/providers/sentence_provider.dart';
import 'package:ciyu/providers/word_provider.dart';
import 'package:ciyu/styles/custom_colors.dart';
import 'package:ciyu/widgets/word_sheet.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/article_page.dart';
import '../providers/bond_provider.dart';
import '../providers/meet_provider.dart';
import '../styles/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SentenceGenerationView extends HookConsumerWidget {
  SentenceGenerationView({
    Key? key,
  }) : super(key: key);

  final GlobalKey _richTextKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String content = ref.watch(completionProvider);
    var highlightWordIds = RegExp("<em>([a-zA-Z-']+)</em>")
        .allMatches(content)
        .map((match) => match.group(1)!)
        .toSet();
    List<String> unmarkedWordIds = highlightWordIds
        .where((wordId) => !ref.watch(isMetProvider(wordId)))
        .toList();
    if (unmarkedWordIds.isEmpty)
      onFetch(ref);
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification && false) {
          List<int> indices = [];
          List<TextSpan> childSpans = _getChildTextSpans(_richTextKey, indices);
          List<Rect?> childSpanRects =
              _getChildTextSpanRects(_richTextKey, childSpans, indices);

          Set<String> offScreenWords = {};
          for (int i = 0; i < childSpanRects.length; i++) {
            Rect? childSpanRect = childSpanRects[i];
            TextSpan childSpan = childSpans[i];
            if (childSpanRect != null) {
              RenderBox renderBox =
                  _richTextKey.currentContext!.findRenderObject() as RenderBox;
              Offset topLeftPosition = renderBox.localToGlobal(Offset.zero);
              double top = topLeftPosition.dy;
              // final double topOfScreen = _scrollController.position.pixels;
              // final double bottomOfScreen = topOfScreen + MediaQuery.of(context).size.height;

              if (top + childSpanRect.top + childSpanRect.height < 0) {
                String wordId = childSpan.toPlainText();
                print(
                    'Child TextSpan "$wordId" is off-screen. Position is $childSpanRect');
                offScreenWords.add(wordId);
                // print('Child TextSpan "${childSpan.toPlainText()}" is visible.');
              }
            }
          }
          ref.read(offScreenWordIdsProvider.notifier).addAll(offScreenWords);
        }
        return true;
      },
      child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(), //反弹效果
          slivers: <Widget>[
            SliverAppBar(title: Text("自动生成的文章")),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: CustomColors.card,
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  //   width: double.infinity,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Center(child: Text("已开启划出屏幕的生词自动标记认识",)),
                  //   ),
                  // ),
                  _buildContent(content),
                  SizedBox(height: 20),
                  unmarkedWordIds.isNotEmpty
                      ? _buildUnmarkedWords(unmarkedWordIds, ref)
                      : Center(child: CircularProgressIndicator()),
                ]),
              ),
            ),
          ]),
    );
  }

  Container _buildUnmarkedWords(List<String> unmarkedWordIds, WidgetRef ref) {
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
                                    ..onTap = () => _showWordSheet(wordId, "", useContext()),
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
                              articleId: "");
                          onFetch(ref);
                        },
                        label: Text("一键标记认识并继续生成"),
                        icon: Icon(Icons.done_all),
                      ),
              ],
            ),
          );
  }

  Widget _buildContent(String content) {
    TextStyle contentStyle =
        textTheme.bodyLarge!.copyWith(fontFamily: 'Times New Roman');
    return _buildClickableText(content, contentStyle);
  }

  List<TextSpan> _getChildTextSpans(GlobalKey key, List<int> indices) {
    TextSpan parentSpan =
        (key.currentContext!.widget as SelectableText).textSpan!;
    List<TextSpan> childSpans = [];

    if (parentSpan.children != null) {
      for (int i = 0; i < parentSpan.children!.length; i++) {
        var childSpan = parentSpan.children![i] as TextSpan;
        if (childSpan.style != null && childSpan.style!.color == Colors.blue) {
          childSpans.add(childSpan);
          indices.add(i);
        }
      }
    }

    return childSpans;
  }

  List<Rect?> _getChildTextSpanRects(
      GlobalKey key, List<TextSpan> targetTextSpans, List<int> indices) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject()! as RenderBox;
    TextSpan rootTextSpan =
        (key.currentContext!.widget as SelectableText).textSpan!;
    BuildContext context = key.currentContext!;

    TextPainter textPainter = TextPainter(
      text: rootTextSpan,
      textDirection: Directionality.of(context),
      maxLines: null,
    );

    textPainter.layout(minWidth: 0, maxWidth: renderBox.size.width);

    List<Rect?> childSpanRects = [];

    String _getPrecedingText(
        TextSpan parentSpan, TextSpan childSpan, int childIndex) {
      if (childIndex > parentSpan.children!.length) {
        throw Exception(
            'Child TextSpan not found in the given parent TextSpan.');
      }
      return parentSpan.children!
          .sublist(0, childIndex)
          .map((span) => span.toPlainText())
          .join();
    }

    for (int i = 0; i < targetTextSpans.length; i++) {
      var targetTextSpan = targetTextSpans[i];
      String precedingText =
          _getPrecedingText(rootTextSpan, targetTextSpan, indices[i]);
      // print("preceding:" + precedingText);
      int targetTextIndex = precedingText.length;

      if (targetTextIndex != -1) {
        TextPosition startTextPosition = TextPosition(offset: targetTextIndex);
        TextPosition endTextPosition = TextPosition(
            offset: targetTextIndex + targetTextSpan.toPlainText().length);
        final Offset startOffset =
            textPainter.getOffsetForCaret(startTextPosition, Rect.zero);
        final Offset endOffset =
            textPainter.getOffsetForCaret(endTextPosition, Rect.zero);
        final double lineHeight = endOffset.dy - startOffset.dy;
        childSpanRects.add(Rect.fromLTWH(startOffset.dx, startOffset.dy,
            endOffset.dx - startOffset.dx, lineHeight));
      } else {
        childSpanRects.add(null);
      }
    }

    return childSpanRects;
  }

  Rect? _getChildTextSpanRect(
      BuildContext context, GlobalKey key, TextSpan targetTextSpan) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject()! as RenderBox;
    TextSpan rootTextSpan =
        (key.currentContext!.widget as SelectableText).textSpan!;

    int _findChildIndex(TextSpan parentSpan, TextSpan childSpan) {
      if (parentSpan.children != null) {
        for (int i = 0; i < parentSpan.children!.length; i++) {
          if (parentSpan.children![i] == childSpan) {
            return i;
          }
        }
      }
      return -1;
    }

    String _getPrecedingText(TextSpan parentSpan, TextSpan childSpan) {
      int childIndex = _findChildIndex(parentSpan, childSpan);
      if (childIndex == -1) {
        throw Exception(
            'Child TextSpan not found in the given parent TextSpan.');
      }
      return parentSpan.children!
          .sublist(0, childIndex)
          .map((span) => span.toPlainText())
          .join();
    }

    String precedingText = _getPrecedingText(rootTextSpan, targetTextSpan);

    TextStyle contentStyle =
        textTheme.bodyLarge!.copyWith(fontFamily: 'Times New Roman');

    TextSpan updatedTextSpan = TextSpan(
      text: rootTextSpan.text,
      style: contentStyle,
      children: rootTextSpan.children,
      recognizer: rootTextSpan.recognizer,
    );

    TextPainter textPainter = TextPainter(
      text: updatedTextSpan,
      textDirection: Directionality.of(context),
      maxLines: null,
    );
    textPainter.layout(minWidth: 0, maxWidth: renderBox.size.width);

    int targetTextIndex = precedingText.length;

    if (targetTextIndex != -1) {
      TextPosition startTextPosition = TextPosition(offset: targetTextIndex);
      TextPosition endTextPosition = TextPosition(
          offset: targetTextIndex + targetTextSpan.toPlainText().length);
      final Offset startOffset =
          textPainter.getOffsetForCaret(startTextPosition, Rect.zero);
      final Offset endOffset =
          textPainter.getOffsetForCaret(endTextPosition, Rect.zero);
      final double lineHeight = endOffset.dy - startOffset.dy;
      return Rect.fromLTWH(startOffset.dx, startOffset.dy,
          endOffset.dx - startOffset.dx, lineHeight);
    } else {
      return null;
    }
  }

  Widget _buildClickableText(String content, TextStyle style) {
    return Consumer(builder: (context, ref, child) {
      return EasyRichText(
        content,
        defaultStyle: style,
        selectable: true,
        richTextKey: _richTextKey,
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

              String contextBeforeWord =
                  content.substring(startIndex, wordStart);
              String contextAfterWord = content.substring(wordEnd!, endIndex);

              String task = '$contextBeforeWord[$wordId]$contextAfterWord'
                  .replaceAll("<em>", "")
                  .replaceAll("</em>", "");

              // print("word: $wordId, startIndex: $startIndex, wordStart: ${wordStart}, wordEnd: ${wordEnd}, endIndex: $endIndex, task: $task");
              bool hasHighlight = match[1] != null;

              bool? newlyBondedStatus =
                  ref.watch(newlyBondedStatusProvider(wordId));

              var textSpan = TextSpan(
                text: wordId,
                style: TextStyle(
                    color: newlyBondedStatus ?? hasHighlight
                        ? Colors.blue
                        : Colors.black),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _showWordSheet(wordId, task, context);
                  },
              );
              // _scrollController.addListener(() {
              //   Rect? childTextSpanRect = _getChildTextSpanRect(context, _richTextKey, textSpan);
              // });
              return textSpan;
            },
          ),
        ],
      );
    });
  }

  bool isChildTextSpanVisible(Rect? childTextSpanRect, double scrollOffset,
      double viewportWidth, double viewportHeight) {
    if (childTextSpanRect == null) {
      return false;
    }

    double minYVisible = scrollOffset;
    double maxYVisible = scrollOffset + viewportHeight;
    double minXVisible = 0;
    double maxXVisible = viewportWidth;

    return childTextSpanRect.top < maxYVisible &&
        childTextSpanRect.bottom > minYVisible &&
        childTextSpanRect.left < maxXVisible &&
        childTextSpanRect.right > minXVisible;
  }

  void _showWordSheet(String wordId, String task, BuildContext context) {
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
            articleId: "[generated]",
          );
        });
  }

  void onFetch(WidgetRef ref) {
    ref.read(completionProvider.notifier).fetch();
  }

  Future<void> onReset(WidgetRef ref) async {
    ref.read(completionProvider.notifier).reset();
  }
}
