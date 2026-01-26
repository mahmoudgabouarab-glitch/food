import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/servise_locator.dart';
import 'package:food/features/home/data/model/products_model/products_model.dart';
import 'package:food/features/home/data/repo/home_repo_impl.dart';
import 'package:food/features/home/presentation/view/widgets/details/details_body.dart';
import 'package:food/features/home/presentation/view_model/details_cubit/details_cubit.dart';

class DetailsView extends StatelessWidget {
  final ListOfProducts products;
  const DetailsView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(getIt<HomeRepoImpl>())
        ..getSideOptions()
        ..getToppings(),
      child: DetailsBody(products: products),
    );
  }
}
