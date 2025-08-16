import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/mappers/category_mapper.dart';
import 'package:ecommerce/features/home/data/models/get_categories_response/get_categories_response.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);
  @override
  Future<Either<List<Category>, Failure>> getCategories() async {
    try {
      final GetCategoriesResponse response =
          await _homeRemoteDataSource.getCategories();
      final List<Category> categories =
          response.data.map((category) => category.toCategoryEntity).toList();
      return Left(categories);
    } on AppException catch (exception) {
      return Right(Failure(exception.message));
    }
  }
}
