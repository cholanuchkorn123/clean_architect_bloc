import 'package:clean_architech_practice/core/resources/data_state.dart';
import 'package:clean_architech_practice/features/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticle();
}
