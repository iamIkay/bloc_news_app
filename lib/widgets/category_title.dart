import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ui/widgets/category_news_widget/bloc/category_news_bloc.dart';
import '../ui/widgets/category_news_widget/bloc/category_news_state.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsBloc, CategoryNewsState>(
        builder: ((context, state) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Text(state.category!.toUpperCase(),
            style:
                const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700)),
      );
    }));
  }
}
