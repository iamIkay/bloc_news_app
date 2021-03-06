import 'package:flutter/material.dart';
import 'package:news_app_bloc/repository/models/headline_news.dart';
import '../../../repository/models/news_model.dart';
import '../../../widgets/helper_widgets.dart';

class AllNewsSuccess extends StatelessWidget {
  const AllNewsSuccess(
      {required this.headlineNews, super.key});

  final HeadlineNews headlineNews;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 160.0),
            child: ListView.builder(
                itemCount: headlineNews.stories!.length,
                itemBuilder: ((context, index) {
                  Story story = headlineNews.stories![index];
                  return BuildNewsCard(story: story);
                })),
          ),
        )
      ]),
    );
  }
}
