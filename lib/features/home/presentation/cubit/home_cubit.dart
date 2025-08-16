import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getCategories) : super(HomeInitial()) {
    getCategories();
  }
  final GetCategories _getCategories;

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final Either<List<Category>, Failure> categories = await _getCategories();
    categories.fold(
      (categories) => emit(GetCategoriesSuccess(categories)),
      (failure) => emit(GetCategoriesError(failure.message)),
    );
  }
}
