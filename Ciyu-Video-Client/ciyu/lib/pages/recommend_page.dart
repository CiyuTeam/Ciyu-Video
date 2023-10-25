import 'package:ciyu/pages/article_page.dart';
import 'package:ciyu/pages/bond_page.dart';
import 'package:ciyu/pages/search_page.dart';
import 'package:ciyu/providers/article_provider.dart';
import 'package:ciyu/styles/theme.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/article_list_view.dart';

class SourceConfig {
  String name;
  String source;

  SourceConfig({required this.name, required this.source});
}

class RecommendPage extends HookConsumerWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SourceConfig> configs = [
      SourceConfig(name: "聚合", source: ""),
      SourceConfig(name: "Quora", source: "Quora"),
      SourceConfig(name: "人民日报", source: "China Daily"),
      SourceConfig(name: "短笑话", source: "Joke Buddha"),
      SourceConfig(name: "睡前故事", source: "Bedtime"),
    ];
    List<List<SearchHitArticle>> articleFamilies = configs
        .map((config) => ref.watch(articlesProvider(config.source)))
        .toList();
    List<ArticlesNotifier> articlesNotifiers = configs
        .map((config) => ref.watch(articlesProvider(config.source).notifier))
        .toList();
    return DefaultTabController(
      length: configs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset("svgs/menu.svg"),
            onPressed: () {
              Navigator.of(context).push(BondPage.route());
            },
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Hero(
              tag: "search",
              child: TextField(
                readOnly: true,
                onTap: () => Navigator.of(context).push(SearchPage.route()),
                decoration: InputDecoration(contentPadding: EdgeInsets.all(12)),
              ),
            ),
          ),
          titleSpacing: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: TabBar(
                      indicatorPadding: EdgeInsets.symmetric(vertical: 6),
                      physics: BouncingScrollPhysics(),
                      isScrollable: true,
                      tabs: configs
                          .map((config) => Tab(text: config.name))
                          .toList(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // 添加新类别的逻辑
                  },
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children:
            List.generate(configs.length, (index) => ArticleListView(
              articles: articleFamilies[index],
              onFetch: () => articlesNotifiers[index].fetch(),
              onReset: () => articlesNotifiers[index].reset(),
            )),
        ),
      ),
    );
  }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RecommendPage());
  }
}
