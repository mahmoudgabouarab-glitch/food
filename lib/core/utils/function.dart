import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';

//----------------Token Check--------------------\\
bool isloggedInUser = false;
void checkIsloggedinuser() async {
  String? userToken = await CacheHelper.getSecuredString(key: CacheKeys.token);
  if (userToken != null && userToken.isNotEmpty) {
    isloggedInUser = true;
  } else {
    isloggedInUser = false;
  }
}
