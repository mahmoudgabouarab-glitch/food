import 'package:flutter/material.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/extension.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/Favorites/presentation/view/edit_title_view.dart';
import 'package:food/features/home/data/model/fav_products/fav_products_response.dart';

class FavoritesTitle extends StatelessWidget {
  final FavProductsResponse favProductsResponse;
  const FavoritesTitle({super.key, required this.favProductsResponse});

  @override
  Widget build(BuildContext context) {
    var cacheTitle = CacheHelper.getDataString(key: CacheKeys.favoritesTitle);
    var title = cacheTitle == null ? "Default Title" : cacheTitle.toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: Styles.s18_600),
        spaceH(10),
        Divider(thickness: 3, color: AppColor.primary),
        spaceH(10),
        Row(
          children: [
            Text(
              "${favProductsResponse.data.length} items",
              style: Styles.s14_500,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                context.push(const EditTitleView());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Edit title", style: Styles.s14_500),
                  spaceW(4),
                  Icon(Icons.edit_note_outlined, color: AppColor.primary),
                ],
              ),
            ),
          ],
        ),
        spaceH(10),
      ],
    );
  }
}
