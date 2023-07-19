part of funxtion_sdk;

class AuthRequest {
  Future<bool> loginUser(
      {bool? btn, required String username, required String password}) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    SharedPreferences store = await SharedPreferences.getInstance();
    token = store.getString('token').toString();
    String dateTime = store.getString('dateTime').toString();
    DateTime? date = dateTime != "null" ? DateTime.parse(dateTime) : null;
    int diff = date != null ? DateTime.now().difference(date).inHours : 0;
    if (btn == true) {
      var response = await dio.post(
        "auth/token",
        data: {"username": "nasir@evolverstech.com", "password": "P@ss.1122"},
        options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
      );
      if (response.statusCode == 200) {
        token = response.data['token'].toString();
        store.setString('token', token ?? '');
        store.setString('dateTime', "${DateTime.now()}");
        return true;
      }
      return false;
    } else if (token != "null" && diff >= 4) {
      var response = await dio.post(
        "auth/token",
        data: {"username": "nasir@evolverstech.com", "password": "P@ss.1122"},
        options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
      );
      if (response.statusCode == 200) {
        token = response.data['token'].toString();
        store.setString('token', token ?? '');
        store.setString('dateTime', "${DateTime.now()}");
        return true;
      }
      return false;
    } else if (token != "null") {
      return true;
    }
    return false;
  }
}
