import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';




class RedirectUtil {



  static Future<String?> redirect(
      BuildContext context, GoRouterState state) async {

    debugPrint("redirect for auth working");
    // SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();

    bool userAuthenticated =  false;
        // sharedPreferences.getBool(SharedPreferencesKey.isLogin) ?? false;
    debugPrint("userAuthenticated $userAuthenticated");

    if(userAuthenticated == false )
    {
      return '/login';
    }
    else
    {
      return null;
    }
  }


}
