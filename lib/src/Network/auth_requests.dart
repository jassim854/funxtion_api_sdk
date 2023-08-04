import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../funxtion_sdk.dart';

class AuthRequest {
  static String? _token;
  static String get getToken {
    return _token.toString();
  }

  static Future<bool> loginUser(
      {required String username,
      required String password,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      netwoerkHelper.dioCacheManager = DioCacheManager(CacheConfig());

      netwoerkHelper.dio.interceptors
          .add(netwoerkHelper.dioCacheManager?.interceptor);
      var response = await netwoerkHelper.postAuthRequest(
          username: username,
          password: password,
          maxAge: maxAge ?? const Duration(hours: 4),
          forceRefresh: forceRefresh ?? false,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        _token = response.data['token'].toString();

        // print(NetwoerkHelper.getToken);
        // print(NetwoerkHelper.getToken);
        return true;
      }
      return false;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
