import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/all_news_success.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_bloc.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_state.dart';
import '../../repository/models/news_model.dart';

class AllNewsView extends StatelessWidget {
  const AllNewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsBloc, CategoryNewsState>(
        builder: ((context, state) {

      return state.status!.isComplete
          ? AllNewsSuccess(everything: state.allStories!, title: "${state.category}")
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
