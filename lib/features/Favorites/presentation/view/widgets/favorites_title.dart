import 'package:flutter/material.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/home/data/model/fav_products/fav_products_response.dart';

class FavoritesTitle extends StatelessWidget {
  final FavProductsResponse favProductsResponse;
  const FavoritesTitle({super.key, required this.favProductsResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Favorites", style: Styles.s18_600),
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
              onTap: () {},
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
