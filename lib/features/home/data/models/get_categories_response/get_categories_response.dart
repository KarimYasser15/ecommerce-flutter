import 'package:ecommerce/features/home/data/models/get_categories_response/categories_model.dart';
import 'package:ecommerce/features/home/data/models/get_categories_response/metadata.dart';

class GetCategoriesResponse {
  int results;
  Metadata metadata;
  List<CategoriesModel> data;

  GetCategoriesResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory GetCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return GetCategoriesResponse(
      results: json['results'] as int,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => CategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
