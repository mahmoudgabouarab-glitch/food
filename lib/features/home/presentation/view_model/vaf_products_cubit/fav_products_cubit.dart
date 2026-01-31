import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/fav_products/fav_products_response.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'fav_products_state.dart';

class FavProductsCubit extends Cubit<FavProductsState> {
  FavProductsCubit(this._repo) : super(FavProductsInitial());

  final HomeRepo _repo;
  final Set<int> _favoriteIds = {};

  bool isFavorite(int productId) => _favoriteIds.contains(productId);

  Future<void> getFavProducts() async {
    final result = await _repo.getFavProducts();
    result.fold(
      (failure) => emit(GetFavProductsFailure(failure.errormessage)),
      (success) {
        _favoriteIds
          ..clear()
          ..addAll(success.data.map((e) => e.id));
        emit(GetFavProductsSuccess(success));
      },
    );
  }

  Future<void> postFavProducts(int id) async {
    emit(FavProductsLoading(id));

    final result = await _repo.postFavProducts(id: id);
    result.fold((failure) => emit(FavProductsFailure(failure.errormessage)), (
      success,
    ) async {
      _favoriteIds.contains(id)
          ? _favoriteIds.remove(id)
          : _favoriteIds.add(id);

      emit(FavProductsSuccess(success.message));
      emit(FavProductsUpdated());
    });
  }
}
