import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';
import 'package:food/features/auth/data/models/auth_model.dart';
import 'package:food/features/auth/data/repo/auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._repo) : super(LogoutInitial());
  final AuthRepo _repo;
  Future<void> postLogout() async {
    emit(LogoutLoading());
    var data = await _repo.postlogout();
    data.fold(
      (failure) {
        emit(LogoutFailure(failure.errormessage));
      },
      (success) async {
        await CacheHelper.removeData(key: CacheKeys.token);

        emit(LogoutSuccess(success));
      },
    );
  }
}
