import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/ui/widgets/news_detail/news_detail_page.dart';
import 'package:news_app_bloc/widgets/get_categories.dart';
import '../repository/models/news_category.dart';
import '../repository/models/news_model.dart';
import '../ui/widgets/category_news_widget/bloc/category_news_bloc.dart';
import '../ui/widgets/category_news_widget/bloc/category_news_event.dart';
import '../ui/widgets/category_news_widget/bloc/category_news_state.dart';

class BuildCategoryCard extends StatelessWidget {
  const BuildCategoryCard(
      {required this.categoryId,
      required this.category,
      required this.index,
      Key? key})
      : super(key: key);

  final String categoryId;
  final NewsCategory category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CategoryNewsBloc, CategoryNewsState, bool>(
        selector: (state) =>
            (state.category!.toLowerCase() == categoryId.toLowerCase())
                ? true
                : false,
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              GetCategories.scrollController.animateTo((120.0 * index),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease);
              if (!state) {
                context
                    .read<CategoryNewsBloc>()
                    .add(GetCategoryStory(categoryId: categoryId));
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: state ? 120 : 70,
              width: state ? 150 : 130,
              margin: const EdgeInsets.only(left: 5.0),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        category.image!,
                        width: state ? 150 : 130,
                        height: state ? 120 : 70,
                      )),
                  Positioned.fill(
                      child: Center(
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 15.0),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(category.name!,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: state ? 18.0 : 14.0))),
                  ))
                ],
              ),
            ),
          );
        });
  }
}

class BuildNewsCard extends StatelessWidget {
  const BuildNewsCard({this.story, super.key});
  final Story? story;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => NewsDetail(story: story!))),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 25.0),
        child: Column(children: [
          ClipRRect(
            child: Image.network(
              story!.urlToImage ??
                  'https://www.nutraingredients-asia.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/nutraingredients-asia.com/china/apac-november-headline-news2/13069005-1-eng-GB/APAC-November-Headline-News.jpg',
              height: 200,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            story!.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            maxLines: 2,
          ),
          const SizedBox(height: 5.0),
          Text(
            story!.description ?? story!.content ?? "",
            style: const TextStyle(fontSize: 14.0),
            maxLines: 2,
          ),
        ]),
      ),
    );
  }
}
