import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_bloc/repository/news_repository.dart';
import 'package:news_app_bloc/repository/service/news_service.dart';
import 'package:news_app_bloc/ui/widgets/category_news_widget/bloc/category_news_bloc.dart';
import 'package:news_app_bloc/ui/widgets/category_news_widget/bloc/category_news_event.dart';
import 'ui/widgets/category_news_widget/news_page.dart';
import 'widgets/category_title.dart';
import 'widgets/get_categories.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewsRepository(service: NewsService()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CategoryNewsBloc(
                  newsRepository: context.read<NewsRepository>())
                ..add(GetCategoryStory(categoryId: "general")))
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("BLoC News App"),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      GetCategories(),
                      SizedBox(height: 25.0),
                      CategoryTitle(),
                      CategoryNewsPage(),
                    ]),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
