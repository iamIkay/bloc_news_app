import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/all_news_success.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_bloc.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_state.dart';
import '../../repository/models/news_model.dart';
import '../../widgets/helper_widgets.dart';

class AllNewsView extends StatelessWidget {
  const AllNewsView({this.stories, super.key});

  final List<Story>? stories;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNewsBloc, AllNewsState>(builder: ((context, state) {
      log(state.status!.toString());
      return state.status!.isComplete
          ? AllNewsSuccess(everything: state.allStories!, title: "All News")
          : state.status!.isLoading
              ? Container(
                  margin: const EdgeInsets.only(top: 200.0),
                  child: const Center(child: CircularProgressIndicator()))
              : state.status!.isError
                  ? const Center(child: Text("Error fetching News"))
                  : const SizedBox();
    }));
  }
}
