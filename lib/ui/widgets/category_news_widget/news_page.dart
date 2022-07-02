import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/category_news_bloc.dart';
import 'bloc/category_news_state.dart';
import 'category_news_success.dart';

class CategoryNewsPage extends StatelessWidget {
  const CategoryNewsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsBloc, CategoryNewsState>(
        builder: ((context, state) {
      return state.status!.isComplete
          ? AllNewsSuccess(
              everything: state.allStories!, title: "${state.category}")
          : state.status!.isLoading
              ? Container(
                  margin: const EdgeInsets.only(top: 200.0),
                  child: const Center(child: CircularProgressIndicator()))
              : state.status!.isError
                  ? Container(
                      margin: const EdgeInsets.only(top: 200.0),
                      child: const Center(child: Text("Error fetching News")))
                  : const SizedBox();
    }));
  }
}
