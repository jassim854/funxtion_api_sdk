import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../funxtion_sdk.dart';

class ContentProviderCategoryOnDemandRequest {
  static Future<List<Map<String, dynamic>>?> contentProviders({
    bool forceRefresh = true,
    Duration maxStale = const Duration(days: 7),
  }) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
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
            netwoerkHelper, maxStale, forceRefresh, checkInternet);
        response = await netwoerkHelper.getListOfContentProviderRequest();
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await netwoerkHelper.getListOfContentProviderRequest();
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        return await compute(ResponseConstants.convertResponseList, response);
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future<List<Map<String, dynamic>>?> contentCategory(
      {bool forceRefresh = true,
      Duration maxStale = const Duration(days: 7),
      Map<String, dynamic>? queryParameters}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
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
            netwoerkHelper, maxStale, forceRefresh, checkInternet);
        response = await netwoerkHelper.getListOfContentCategoryRequest(
            queryParameters: queryParameters);
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await netwoerkHelper.getListOfContentCategoryRequest(
            queryParameters: queryParameters);
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        return await compute(ResponseConstants.convertResponseList, response);
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future<List<Map<String, dynamic>>?> onDemandCategory({
    bool forceRefresh = true,
    Duration maxStale = const Duration(days: 7),
  }) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
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
            netwoerkHelper, maxStale, forceRefresh, checkInternet);
        response = await netwoerkHelper.getListOnDemandCategoriesRequest();
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await netwoerkHelper.getListOnDemandCategoriesRequest();
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        return await compute(ResponseConstants.convertResponseList, response);
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static void _addDioCacheInterceptor(
      String path,
      NetwoerkHelper netwoerkHelper,
      Duration maxStale,
      bool forceRefresh,
      bool? checkInternet) {
    netwoerkHelper.dio.interceptors.add(DioCacheInterceptor(
        options: CacheOptions(
            store: HiveCacheStore(path),
            maxStale: maxStale,
            priority: CachePriority.high,
            policy: checkInternet == true && forceRefresh == true
                ? CachePolicy.refreshForceCache
                : CachePolicy.forceCache)));
  }
}
