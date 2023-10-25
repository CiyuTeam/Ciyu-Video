import 'package:ciyu/providers/history_provider.dart';
import 'package:ciyu/widgets/sentence_generation_view.dart';
import 'package:ciyu_api/ciyu_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/article_list_view.dart';

class GenerationPage extends HookConsumerWidget {
  const GenerationPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => GenerationPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SentenceGenerationView(),
    );
  }
}
