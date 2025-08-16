import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/get_categories_response/get_categories_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeApiDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  HomeApiDataSource(this._dio);
  @override
  Future<GetCategoriesResponse> getCategories() async {
    try {
      final Response response = await _dio.get(ApiConstants.categoriesEndPoint);
      return GetCategoriesResponse.fromJson(response.data);
    } catch (exception) {
      String? errorMessage;
      if (exception is DioException) {
        errorMessage = exception.response?.data['message'];
      }
      throw RemoteException(errorMessage ?? "Failed to get categories");
    }
  }
}
