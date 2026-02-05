import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';

//----------------Token Check--------------------\\
bool isloggedInUser = false;
void checkIsloggedinuser() {
  String? userToken = CacheHelper.getDataString(key: CacheKeys.token);
  if (userToken != null && userToken.isNotEmpty) {
    isloggedInUser = true;
  } else {
    isloggedInUser = false;
  }
}

bool isGuest = false;
void checkIsGuest() {
  var guestData = CacheHelper.getData(key: CacheKeys.isGuest);
  if (guestData != null && guestData == true) {
    isGuest = true;
  } else {
    isGuest = false;
  }
}
