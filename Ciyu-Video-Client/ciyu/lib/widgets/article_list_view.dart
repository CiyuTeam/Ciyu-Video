import 'package:ciyu_api/ciyu_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/article_page.dart';
import '../styles/theme.dart';

class ArticleListView extends HookConsumerWidget {
  const ArticleListView({
    Key? key,
    required this.articles,
    required this.onFetch,
    required this.onReset,
    this.source = "",
  }) : super(key: key);

  final List<SearchHitArticle> articles;
  final Function onFetch;
  final RefreshCallback onReset;
  final String source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrollController = useScrollController();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        onFetch();
      }
    });
    return RefreshIndicator(
      onRefresh: onReset,
      child: ListView.separated(
        // padding: EdgeInsets.symmetric(vertical: 8),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index < articles.length) {
            return ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articles[index].content!.title!,
                    style: textTheme.titleLarge,
                  ),
                  SizedBox(height: 4),
                  if (articles[index].highlightFields!.containsKey("content"))
                    Text(
                      RegExp("<em>([a-zA-Z-']+)</em>")
                          .allMatches(
                              (articles[index].highlightFields!["title"] == null
                                      ? " "
                                      : articles[index]
                                          .highlightFields!["title"]![0]) +
                                  (articles[index]
                                              .highlightFields!["content"] ==
                                          null
                                      ? " "
                                      : articles[index]
                                          .highlightFields!["content"]![0]))
                          .map((match) => match.group(1)!)
                          .toSet()
                          .reduce((value, element) => value + ", " + element),
                      style: textTheme.titleSmall!.copyWith(
                          color: Colors.grey, fontFamily: "San Francisco"),
                      overflow: TextOverflow.ellipsis,
                    ),
                  SizedBox(height: 16),
                  if (articles[index].content!.thumbnail != null && articles[index].content!.thumbnail!.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        articles[index].content!.thumbnail!,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),
                    ),
                  if (articles[index].content!.thumbnail == null || articles[index].content!.thumbnail!.isEmpty)
                    Text(
                      articles[index].content!.content!,
                      maxLines: 6,
                      style: textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(ArticlePage.route(articles[index]));
              },
            );
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: articles.length + 1,
        controller: scrollController,
      ),
    );
  }
}
