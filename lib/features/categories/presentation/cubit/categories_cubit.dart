import 'package:bloc/bloc.dart';
import 'package:fada_alhalij_web/features/categories/domain/entities/categories_zone_entity.dart';
import 'package:fada_alhalij_web/features/categories/domain/use_cases/categoriesUseCase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesZoneUseCase _categoriesZoneUseCase;

  CategoriesCubit(this._categoriesZoneUseCase) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());

    final result = await _categoriesZoneUseCase.getCategoriesZone(10);
    switch (result) {
      case Success<CategoriesZoneEntity?>():
        {
          if (!isClosed) {
            emit(CategoriesSuccess(result.data));
          }
        }
      case Fail<CategoriesZoneEntity>():
        {
          emit(CategoriesFail(result.exception));
        }
    }
  }
}
