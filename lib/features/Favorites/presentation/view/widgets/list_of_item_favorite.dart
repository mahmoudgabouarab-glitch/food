import 'package:flutter/material.dart';
import 'package:food/features/Favorites/presentation/view/widgets/item_of_favorite.dart';

class ListOfItemFavorite extends StatelessWidget {
  const ListOfItemFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemOfFavorite();
        },
      ),
    );
  }
}
