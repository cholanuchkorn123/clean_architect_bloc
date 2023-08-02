import 'package:clean_architech_practice/core/resources/data_state.dart';
import 'package:clean_architech_practice/core/usecases/usecases.dart';
import 'package:clean_architech_practice/features/domain/repository/article_repo.dart';

import '../entities/article.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getArticle();
  }
}
