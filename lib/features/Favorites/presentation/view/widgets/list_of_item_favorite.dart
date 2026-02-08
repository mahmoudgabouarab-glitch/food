import 'package:flutter/material.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/features/Favorites/presentation/view/widgets/item_of_favorite.dart';
import 'package:food/features/home/data/model/fav_products/fav_products_response.dart';
import 'package:food/features/home/presentation/view/details_view.dart';

class ListOfItemFavorite extends StatelessWidget {
  final FavProductsResponse favProductsResponse;
  const ListOfItemFavorite({super.key, required this.favProductsResponse});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: favProductsResponse.data.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              final favoriteProduct = favProductsResponse.data[index];
              final product = favoriteProduct.toListOfProducts();
              context.push(DetailsView(products: product));
            },
            child: ItemOfFavorite(
              favoriteProducts: favProductsResponse.data[index],
            ),
          );
        },
      ),
    );
  }
}
