import 'package:ciyu/providers/history_provider.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/article_list_view.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => HistoryPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SearchHitArticle> articles = ref.watch(historiesProvider);
    HistoriesNotifier articlesNotifier = ref.read(historiesProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("历史记录"),
      ),
      body: ArticleListView(
        articles: articles,
        onFetch: () => articlesNotifier.fetch(),
        onReset: () => articlesNotifier.reset(),
      ),
    );
  }
}
