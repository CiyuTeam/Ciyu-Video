import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:ciyu/styles/custom_colors.dart';
import 'package:ciyu/styles/theme.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timelines/timelines.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../providers/bond_provider.dart';
import '../providers/meet_provider.dart';
import '../providers/word_provider.dart';

class WordPage extends HookConsumerWidget {
  final String wordId;

  const WordPage(this.wordId, {Key? key}) : super(key: key);

  static Route route(String wordId) {
    return MaterialPageRoute<void>(builder: (_) => WordPage(wordId));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> showAvg = useState(false);
    AsyncValue<WordDto> word = ref.watch(wordProvider(wordId));
    return Scaffold(
      appBar: AppBar(
        title: Text(wordId),
        actions: [
          if (word is AsyncData)
            IconButton(
              onPressed: () {
                final isBonded = ref.watch(isBondedProvider(wordId));
                AsyncValue<WordDto> word = ref.watch(wordProvider(wordId));
                final hasBondNotifier =
                    ref.read(hasBondProvider(wordId).notifier);
              },
              icon: word.value!.hasBond!
                  ? Icon(Icons.bookmark)
                  : Icon(Icons.bookmark_add_outlined),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            crossAxisAlignment: word is AsyncLoading
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              word.when(
                data: (data) => _buildWordHint(data),
                error: (error, stackTrace) => Container(),
                loading: () => Container(),
              ),
              if (word is AsyncData) SizedBox(height: 12),
              word.when(
                data: (data) => _buildMeanings(data.meanings!.toList()),
                error: (error, stackTrace) => Text("查询失败"),
                loading: () => Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              ),
              if (word is AsyncData) SizedBox(height: 24),
              if (word is AsyncData) _buildForgettingCurve(),
              if (word is AsyncData) SizedBox(height: 24),
              if (word is AsyncData) _MeetTimeline(wordId: wordId),
            ],
          ),
        ),
      ),
    );
  }

  AspectRatio _buildForgettingCurve() {
    return AspectRatio(
      aspectRatio: 1.70,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: Color(0xff232d37),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 12,
            top: 24,
            bottom: 12,
          ),
          child: _ForgettingCurve(wordId: wordId),
        ),
      ),
    );
  }

  Container _buildWordHint(WordDto word) {
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

class _MeetTimeline extends HookConsumerWidget {
  final String wordId;

  const _MeetTimeline({
    Key? key,
    required this.wordId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<MeetDto>> meets = ref.watch(meetsProvider(wordId));
    return meets is AsyncData
        ? FixedTimeline.tileBuilder(
            theme: TimelineTheme.of(context).copyWith(
              nodePosition: 0,
              connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                    thickness: 0.8,
                    color: CustomColors.normal,
                  ),
              indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                    size: 6,
                    position: 0,
                    color: CustomColors.normal,
                  ),
            ),
            builder: TimelineTileBuilder(
              contentsAlign: ContentsAlign.basic,
              contentsBuilder: (context, index) {
                return Transform.translate(
                  // e.g: vertical negative margin
                  offset: Offset(
                      0,
                      -(textTheme.bodySmall!.height! *
                              textTheme.bodySmall!.fontSize! /
                              2 -
                          6 / 2)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          timeago.format(meets.value![index].createdTime!),
                          style: textTheme.bodySmall!.copyWith(
                            fontFamily: "SF Pro Text",
                            color: CustomColors.lightGrey,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          meets.value![index].article != null
                              ? meets.value![index].article!.title!
                              : "自动生成的文章",
                          style: textTheme.titleMedium!,
                        )
                      ],
                    ),
                  ),
                );
              },
              startConnectorBuilder: (_, index) =>
                  index == 0 ? null : Connector.solidLine(),
              endConnectorBuilder: (_, index) => Connector.solidLine(),
              indicatorBuilder: (_, index) => DotIndicator(),
              itemCount: meets.value!.length,
            ),
          )
        : Container();
  }
}

class _ForgettingCurve extends HookConsumerWidget {
  final String wordId;
  final List<Color> gradientColors = const [
    Color(0xff23b6e6),
    Color(0xff02d39a),
  ];

  const _ForgettingCurve({
    Key? key,
    required this.wordId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<MeetDto>> meets = ref.watch(meetsProvider(wordId));

    double calculateQuality(
        DateTime baseMeetTime, DateTime lastMeetTime, double baseQuality) {
      double base = 0.5;

      int durationInSeconds = lastMeetTime.difference(baseMeetTime).inSeconds;
      double durationInDays = durationInSeconds / 86400.0;
      base = pow(baseQuality, 1.0 / (2 * durationInDays)) as double;

      int elapsedInSeconds = DateTime.now().difference(lastMeetTime).inSeconds;
      double elapsedInDays = elapsedInSeconds / 86400.0;
      return pow(base, elapsedInDays) as double;
    }

    if (meets is AsyncData && meets.value!.isNotEmpty) {
      List<MeetDto> expandedMeets =
          List<MeetDto>.generate(meets.value!.length * 2 - 1, (index) {
        int originalIndex = index ~/ 2;
        MeetDto meet = meets.value![originalIndex];

        if (index.isEven) {
          return meet;
        } else {
          DateTime prevCreatedTime;
          DateTime nextCreatedTime;

          prevCreatedTime = meet.createdTime!;

          nextCreatedTime = meets.value![originalIndex + 1].createdTime!;

          return MeetDto((meetDtoBuilder) => meetDtoBuilder
            ..createdTime = meet.createdTime!
            ..quality = calculateQuality(
                prevCreatedTime, nextCreatedTime, meet.quality!));
        }
      });
      expandedMeets.map((e) => e.createdTime!).forEach((element) => print(element));
      return LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 1,
            verticalInterval: 24 * 60,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 0.1,
                getTitlesWidget: leftTitleWidgets,
                reservedSize: 42,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d)),
          ),
          minX: 0,
          maxX: expandedMeets.last.createdTime!
              .difference(meets.value!.first.createdTime!)
              .inDays
              .toDouble(),
          minY: 0,
          maxY: 1,
          lineBarsData: [
            LineChartBarData(
              spots: expandedMeets
                  .map((meet) => FlSpot(
                      meet.createdTime!
                          .difference(meets.value!.first.createdTime!)
                          .inDays
                          .toDouble(),
                      meet.quality!))
                  .toList(),
              isCurved: false,
              // curveSmoothness: 0,
              gradient: LinearGradient(
                colors: gradientColors,
              ),
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
    } else
      return Container();
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontSize: 12,
      fontFamily: 'SF Pro Text',
    );
    Widget text;
    switch (Duration(hours: value.round()).inMinutes) {
      case 1:
        text = const Text('1天后', style: style);
        break;
      case 5:
        text = const Text('5天后', style: style);
        break;
      case 8:
        text = const Text('8天后', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontSize: 12,
      fontFamily: 'SF Pro Text',
    );
    String text;
    switch ((value * 10).round()) {
      case 10:
        text = '100%';
        break;
      case 8:
        text = '80%';
        break;
      case 6:
        text = '60%';
        break;
      case 4:
        text = '40%';
        break;
      case 2:
        text = '20%';
        break;
      case 0:
        text = '0%';
        break;

      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
