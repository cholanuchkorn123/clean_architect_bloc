import 'dart:io';

import 'package:clean_architech_practice/core/resources/data_state.dart';
import 'package:clean_architech_practice/features/data/data_source/remote/remote_api_services.dart';
import 'package:clean_architech_practice/features/data/models/article_model.dart';

import 'package:clean_architech_practice/features/domain/repository/article_repo.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/constants.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewApiServices _newApiServices;
  const ArticleRepositoryImpl(this._newApiServices);
  @override
  Future<DataState<List<ArticleModel>>> getArticle() async {
    try {
      print('inside');
      final httpResponse = await _newApiServices.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
