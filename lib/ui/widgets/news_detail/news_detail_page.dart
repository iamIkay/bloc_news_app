import 'package:flutter/material.dart';
import 'package:news_app_bloc/repository/models/news_model.dart';
import 'package:intl/intl.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({required this.story, super.key});

  final Story story;
  @override
  Widget build(BuildContext context) {
    var dateFormatter = DateFormat('MM/dd/yyyy');
    var date = dateFormatter.format(story.publishedAt!);
    return Scaffold(
      appBar: AppBar(title: const Text("BLOC NEWS")),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(
            child: Image.network(
              story.urlToImage ??
                  "https://www.nutraingredients-asia.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/nutraingredients-asia.com/china/apac-november-headline-news2/13069005-1-eng-GB/APAC-November-Headline-News.jpg",
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Text(story.title ?? '',
                style: const TextStyle(
                    fontSize: 26.0, fontWeight: FontWeight.w700)),
          ),
          const Divider(thickness: 1.5),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Text(story.author ?? '',
                    style: const TextStyle(fontSize: 14.0)),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Text(date, style: const TextStyle(fontSize: 14.0)),
                const SizedBox(width: 5.0),
                Text(story.source!['name'] ?? '')
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          const Divider(thickness: 1.5),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Text(
              story.content ?? '',
              style: const TextStyle(fontSize: 14.0),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
