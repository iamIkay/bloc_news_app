import 'package:flutter/material.dart';
import '../repository/data.dart';
import '../repository/models/news_category.dart';
import 'helper_widgets.dart';

class GetCategories extends StatelessWidget {
  const GetCategories({super.key});

  static final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsCategory>>(
        future: getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                controller: scrollController,
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) => BuildCategoryCard(
                    categoryId: snapshot.data![index].name!,
                    category: snapshot.data![index],
                    index: index)),
              ),
            );
          }

          if (snapshot.hasError) {
            const Center(
              child: Text("Error fetching categories!"),
            );
          }

          return Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: const Center(child: CircularProgressIndicator()));
        });
  }
}
