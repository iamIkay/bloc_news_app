import 'package:flutter/material.dart';
import '../repository/models/news_category.dart';
import '../repository/models/news_model.dart';

class BuildCategoryCard extends StatelessWidget {
  const BuildCategoryCard({required this.category, Key? key}) : super(key: key);

  final NewsCategory category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 150.0,
        margin: const EdgeInsets.only(left: 10.0),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  category.image!,
                  fit: BoxFit.fill,
                  width: 150.0,
                  height: 120.0,
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: Text(category.name!,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0))))
          ],
        ),
      ),
    );
  }
}

class BuildNewsCard extends StatelessWidget {
  const BuildNewsCard({this.story, super.key});
  final Story? story;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 25.0),
      child: Column(children: [
        ClipRRect(
          child: Image.network(
            story!.urlToImage ??
                'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
            height: 200,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          story!.title ?? '',
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24.0),
          maxLines: 2,
        ),
        const SizedBox(height: 5.0),
        Text(
          story!.content ?? '',
          style: const TextStyle(fontSize: 14.0),
          maxLines: 2,
        ),
      ]),
    );
  }
}
