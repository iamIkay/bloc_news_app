import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/news_repository.dart';
import '../../repository/service/news_service.dart';
import '../../widgets/category_title.dart';
import '../../widgets/get_categories.dart';
import 'category_news_widget/bloc/category_news_bloc.dart';
import 'category_news_widget/bloc/category_news_event.dart';
import 'category_news_widget/news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewsRepository(service: NewsService()),
      child: BlocProvider(
        create: (context) =>
            CategoryNewsBloc(newsRepository: context.read<NewsRepository>())
              ..add(GetCategoryStory(categoryId: "general")),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("BLOC NEWS"),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      GetCategories(),
                      CategoryTitle(),
                      CategoryNewsPage(),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
