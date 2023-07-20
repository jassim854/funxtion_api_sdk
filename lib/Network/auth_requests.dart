part of funxtion_sdk;

class AuthRequest {
  static Future<bool> loginUser(
      {required String username, required String password}) async {
    try {
   _dioCacheManager = DioCacheManager(CacheConfig());
    dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await dio.post(
        "auth/token",
        data: {"username": username, "password": password},
        options: buildCacheOptions(const Duration(hours: 4), forceRefresh: false),
      );
      if (response.statusCode == 200) {
        token = '';
        token = response.data['token'].toString();
        return true;
      }
      return false;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
