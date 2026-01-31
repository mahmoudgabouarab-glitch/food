import 'package:dio/dio.dart';
import 'package:food/core/network/api_service.dart';
import 'package:food/features/auth/data/repo/auth_repo_impl.dart';
import 'package:food/features/cart/data/repo/cart_repo_impl.dart';
import 'package:food/features/home/data/repo/home_repo_impl.dart';
import 'package:food/features/order/data/repo/order_repo_impl.dart';
import 'package:food/features/order_history/data/repo/order_history_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServise>(ApiServise(Dio()));

  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiServise>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServise>()));
  getIt.registerSingleton<CartRepoImpl>(CartRepoImpl(getIt.get<ApiServise>()));
  getIt.registerSingleton<OrderRepoImpl>(
    OrderRepoImpl(getIt.get<ApiServise>()),
  );
  getIt.registerSingleton<OrderHistoryRepoImpl>(
    OrderHistoryRepoImpl(getIt.get<ApiServise>()),
  );
}
