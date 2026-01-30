import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/features/home/data/repo/home_repo.dart';

part 'fav_products_state.dart';

class FavProductsCubit extends Cubit<FavProductsState> {
  FavProductsCubit(this._repo) : super(FavProductsInitial());
  final HomeRepo _repo;
  final Set<int> _favorites = {};
  // post method to add and remove product to favorites
  Future<void> postFavProducts(int id) async {
    emit(FavProductsLoading(productId: id));
    final result = await _repo.postFavProducts(id: id);
    result.fold(
      (failure) =>
          emit(FavProductsFailure(err: failure.errormessage, productId: id)),
      (success) async {
        final isFav = success.message == "PRODUCT ADDED TO FAVORITES";
        if (isFav) {
          _favorites.add(id);
        } else {
          _favorites.remove(id);
        }
        await CacheHelper.saveData(
          key: "favorites",
          value: _favorites.map((e) => e.toString()).toList(),
        );
        emit(
          FavProductsSuccess(
            productId: id,
            isFavorite: isFav,
            message: success.message,
          ),
        );
      },
    );
  }

  // cache favorites products
  void cacheFavorites() {
    final list = CacheHelper.getStringList("favorites");

    _favorites
      ..clear()
      ..addAll(list.map(int.parse));

    emit(FavProductsCached(_favorites));
  }

  // check if product is favorite
  bool isFavorite(int id) => _favorites.contains(id);
}
