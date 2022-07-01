import 'package:flutter/material.dart';
import '../repository/models/data.dart';
import '../repository/models/news_category.dart';
import 'helper_widgets.dart';

class GetCategories extends StatelessWidget {
  const GetCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsCategory>>(
        future: getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            
            return SizedBox(height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) => BuildCategoryCard(category: snapshot.data![index])),
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