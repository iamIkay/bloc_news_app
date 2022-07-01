import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_bloc/repository/news_repository.dart';
import 'package:news_app_bloc/repository/service/news_service.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_bloc.dart';
import 'package:news_app_bloc/ui/widgets/all_news_widget/bloc/all_news_event.dart';
import 'package:news_app_bloc/widgets/get_categories.dart';

import 'ui/widgets/all_news.dart';
import 'utils/app_bloc_observer.dart';

Future main() async {
  await dotenv.load(fileName: "assets/.env");

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
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
              create: (context) =>
                  AllNewsBloc(newsRepository: context.read<NewsRepository>())
                    ..add(GetStories()))
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
                child: Column(children: const [
                  GetCategories(),
                  SizedBox(height: 30.0),
                  AllNewsView(),
                ]),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
