import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/features/Favorites/presentation/view/widgets/favorites_title.dart';
import 'package:food/features/Favorites/presentation/view/widgets/list_of_item_favorite.dart';
import 'package:food/features/home/presentation/view_model/vaf_products_cubit/fav_products_cubit.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavProductsCubit, FavProductsState>(
      builder: (context, state) {
        if (state is GetFavProductsSuccess) {
          return _buildFavoritesBody(state);
        }
        if (state is GetFavProductsFailure) {
          return Center(child: Text(state.err));
        }
        return const Center(child: CustomLoading(size: 20));
      },
    );
  }
}

Widget _buildFavoritesBody(GetFavProductsSuccess state) {
  return Scaffold(
    appBar: AppBar(centerTitle: false, title: const Text("Favorites")),
    body: Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        children: [
          FavoritesTitle(favProductsResponse: state.favProductsModel),
          ListOfItemFavorite(favProductsResponse: state.favProductsModel),
        ],
      ),
    ),
  );
}
