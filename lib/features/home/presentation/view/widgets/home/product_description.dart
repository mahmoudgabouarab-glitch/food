import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_color.dart';
import 'package:food/core/utils/spacing.dart';
import 'package:food/core/widgets/custom_loading.dart';
import 'package:food/core/widgets/custom_snakbar.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/presentation/view_model/vaf_products_cubit/fav_products_cubit.dart';

class ProductDescription extends StatelessWidget {
  final ListOfProducts oneProduct;
  const ProductDescription({super.key, required this.oneProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            oneProduct.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          spaceH(4),
          Text(
            oneProduct.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[200]),
          ),
          SizedBox(height: 9.h),
          Row(
            children: [
              Icon(Icons.star_rate_rounded, color: Colors.yellow),
              Text(
                oneProduct.rating,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              _favProducts(oneProduct),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _favProducts(ListOfProducts product) {
  return BlocConsumer<FavProductsCubit, FavProductsState>(
    listener: (context, state) {
      if (state is FavProductsSuccess && state.productId == product.id) {
        CustomSnackBar.show(
          context,
          message: state.message,
          type: SnackBarType.success,
        );
      }

      if (state is FavProductsFailure && state.productId == product.id) {
        CustomSnackBar.show(
          context,
          message: state.err,
          type: SnackBarType.error,
        );
      }
    },
    builder: (context, state) {
      final cubit = context.read<FavProductsCubit>();
      final isFav = cubit.isFavorite(product.id);

      return InkWell(
        onTap: () => cubit.postFavProducts(product.id),
        child: state is FavProductsLoading && state.productId == product.id
            ? const CustomLoading(color: Colors.white)
            : Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: AppColor.textPrimary,
                    size: 20.sp,
                  ),
                ),
              ),
      );
    },
  );
}
