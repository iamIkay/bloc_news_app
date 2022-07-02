import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/all_news_success.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_bloc.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_state.dart';
import '../../repository/models/news_model.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsBloc, CategoryNewsState>(
        builder: ((context, state) {
      return Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Text(state.category!.toUpperCase(),
            style:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
      );
    }));
  }
}
