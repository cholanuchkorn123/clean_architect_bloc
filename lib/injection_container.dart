import 'package:clean_architech_practice/features/data/data_source/remote/remote_api_services.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/data/repository/article_repository_impl.dart';
import 'features/domain/repository/article_repo.dart';
import 'features/domain/usecases/get_article_usecase.dart';
import 'features/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  // sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewApiServices>(NewApiServices(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(
    sl(),
  ));

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // sl.registerSingleton<GetSavedArticleUseCase>(
  //   GetSavedArticleUseCase(sl())
  // );

  // sl.registerSingleton<SaveArticleUseCase>(
  //   SaveArticleUseCase(sl())
  // );

  // sl.registerSingleton<RemoveArticleUseCase>(
  //   RemoveArticleUseCase(sl())
  // );

  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));

  // sl.registerFactory<LocalArticleBloc>(
  //   ()=> LocalArticleBloc(sl(),sl(),sl())
  // );
}
