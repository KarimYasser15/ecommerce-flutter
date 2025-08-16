import 'package:ecommerce/features/home/data/models/get_categories_response/get_categories_response.dart';

abstract class HomeRemoteDataSource {
  Future<GetCategoriesResponse> getCategories();
}
