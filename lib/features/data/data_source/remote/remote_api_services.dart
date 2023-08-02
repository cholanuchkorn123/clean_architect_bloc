import 'package:clean_architech_practice/core/constants/constants.dart';
import 'package:clean_architech_practice/features/data/models/article_model.dart';
import 'package:clean_architech_practice/features/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_api_services.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewApiServices {
  factory NewApiServices(Dio dio) = _NewApiServices;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
