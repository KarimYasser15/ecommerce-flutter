import 'package:ecommerce/features/home/domain/entities/category.dart';

abstract class HomeState {}

class HomeInitial implements HomeState {}

class GetCategoriesLoading implements HomeState {}

class GetCategoriesError implements HomeState {
  final String message;
  GetCategoriesError(this.message);
}

class GetCategoriesSuccess implements HomeState {
  final List<Category> categories;
  GetCategoriesSuccess(this.categories);
}
