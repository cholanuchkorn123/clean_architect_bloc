import 'package:clean_architech_practice/features/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architech_practice/features/presentation/pages/home/daily_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/app_theme.dart';
import 'features/presentation/bloc/article/remote/remote_article_event.dart';
import 'injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Clean Architect',
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
