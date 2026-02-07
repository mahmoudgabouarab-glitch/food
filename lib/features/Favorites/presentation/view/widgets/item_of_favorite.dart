import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/utils/styles.dart';
import 'package:food/features/home/data/model/fav_products/fav_products_response.dart';
import 'package:food/features/home/presentation/view_model/vaf_products_cubit/fav_products_cubit.dart';

class ItemOfFavorite extends StatelessWidget {
  final FavoriteProduct favoriteProducts;
  const ItemOfFavorite({super.key, required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: favoriteProducts.image,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 80),
                fit: BoxFit.cover,
              ),
            ),
            spaceW(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favoriteProducts.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.s16_500.copyWith(color: AppColor.primary),
                  ),
                  spaceH(5),
                  Text(
                    favoriteProducts.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.s14_500.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () async {
                final result = await _showOkCancelAlertDialog(context);
                if (result == OkCancelResult.ok) {
                  context.read<FavProductsCubit>().postFavProducts(
                    favoriteProducts.id,
                  );
                }
              },
              child: const Icon(Icons.close, color: AppColor.error),
            ),
          ],
        ),
      ),
    );
  }
}

Future<OkCancelResult> _showOkCancelAlertDialog(BuildContext context) =>
    showOkCancelAlertDialog(
      context: context,
      title: "Remove Item",
      message: "Are you sure you want to remove this item?",
      okLabel: "Ok",
      cancelLabel: "Cancel",
      isDestructiveAction: true,
    );
