import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../funxtion_sdk.dart';

class AuthRequest {
  static String? _token;
  static String get getToken => _token.toString();
  static set setToken(String token) {
    _token = token;
  }

  static Future<bool> loginUser(
      {required String username,
      required String password,
      bool forceRefresh = true,
      Duration maxStale = const Duration(hours: 4)}) async {
    NetworkHelper networkHelper = NetworkHelper();
    Response<dynamic> response;
    bool? checkInternet;
    await Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.none) {
        checkInternet = false;
      } else {
        checkInternet = true;
      }
    });

    try {
      if (kIsWeb) {
        _addDioCacheInterceptor(html.window.location.pathname ?? "",
            networkHelper, maxStale, forceRefresh, checkInternet);
        response = await networkHelper.postAuthRequest(
          username: username,
          password: password,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, networkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await networkHelper.postAuthRequest(
          username: username,
          password: password,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        setToken = response.data['token'].toString();

        print(getToken);
        // print(NetworkHelper.getToken);
        return true;
      }
    } on DioError catch (e) {
      print(e.type.name);
      if (forceRefresh == true && e.type.name == 'other') {
      } else {}
      throw convertDioErrorToRequestException(e);
    }
    return false;
  }

  static void _addDioCacheInterceptor(
    String path,
    NetworkHelper networkHelper,
    Duration maxStale,
    bool forceRefresh,
    bool? checkInternet,
  ) {
    networkHelper.dio.interceptors.add(DioCacheInterceptor(
        options: CacheOptions(
            store: HiveCacheStore(path),
            allowPostMethod: true,
            maxStale: maxStale,
            policy: checkInternet == true && forceRefresh == true
                ? CachePolicy.refreshForceCache
                : CachePolicy.forceCache)));
  }
}
