import 'package:ecommerce/features/home/data/models/get_categories_response/categories_model.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';

extension CategoryMapper on CategoriesModel {
  Category get toCategoryEntity => Category(
        id: id,
        name: name,
        image: image,
        slug: slug,
      );
}
