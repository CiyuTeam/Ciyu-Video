import 'package:timeago/src/messages/lookupmessages.dart';

/// Chinese-China messages
class ZhCnShortMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '前';
  @override
  String suffixFromNow() => '后';
  @override
  String lessThanOneMinute(int seconds) => '${seconds}秒';
  @override
  String aboutAMinute(int minutes) => '1分钟';
  @override
  String minutes(int minutes) => '${minutes}分';
  @override
  String aboutAnHour(int minutes) => '1小时';
  @override
  String hours(int hours) => '${hours}小时';
  @override
  String aDay(int hours) => '1天';
  @override
  String days(int days) => '${days} 日';
  @override
  String aboutAMonth(int days) => '1个月';
  @override
  String months(int months) => '${months}个月';
  @override
  String aboutAYear(int year) => '1年';
  @override
  String years(int years) => '${years}年';
  @override
  String wordSeparator() => '';
}
