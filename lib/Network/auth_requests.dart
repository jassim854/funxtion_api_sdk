part of funxtion_sdk;

class AuthRequest {
  static Future<bool> loginUser(
      {required String username, required String password, Duration? maxAge ,bool? forceRefresh,Duration?maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.postAuthRequest(username:  username, password: password,maxAge:maxAge??const Duration(hours: 4),forceRefresh: forceRefresh ,maxStale: maxStale);
      if (response.statusCode == 200) {
        token = response.data['token'].toString();
        return true;
      }
      return false;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
