import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
//----------------guest Check--------------------\\
bool get isGuest => CacheHelper.getData(key: CacheKeys.isGuest) == true;


//----------------Arabic Check--------------------\\
bool isArabic(BuildContext context) {
  if (Locale("ar") == context.locale) {
    return true;
  } else {
    return false;
  }
}
