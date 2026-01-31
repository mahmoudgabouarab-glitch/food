import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  SearchProductsCubit(this._repo) : super(SearchProductsInitial());
  final HomeRepo _repo;

  Future<void> searchProducts({required String query}) async {
    if (query.isEmpty) {
      emit(SearchProductsInitial());
      return;
    }
    emit(SearchProductsLoading());
    final result = await _repo.searchHome(query: query);
    result.fold(
      (failure) => emit(SearchProductsFailure(failure.errormessage)),
      (success) => emit(SearchProductsSuccess(success)),
    );
  }
}
