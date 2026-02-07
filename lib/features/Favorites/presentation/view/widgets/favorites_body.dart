import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/features/Favorites/presentation/view/widgets/favorites_title.dart';
import 'package:food/features/Favorites/presentation/view/widgets/list_of_item_favorite.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: const Text("Favorites")),
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(children: [FavoritesTitle(), ListOfItemFavorite()]),
      ),
    );
  }
}
