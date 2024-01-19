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
        response = await networkHelper.getListOfContentProviderRequest();
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, networkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await networkHelper.getListOfContentProviderRequest();
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
      Duration maxStale = const Duration(days: 7)}) async {
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
        response = await networkHelper.getListOfContentCategoryRequest();
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, networkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await networkHelper.getListOfContentCategoryRequest();
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
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereNameIsEqualTo,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereSlugNameIsEqualTo,
  }) async {
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
        response = await networkHelper.getListOnDemandCategoriesRequest(
      
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, networkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await networkHelper.getListOnDemandCategoriesRequest(
    
        );
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
      NetworkHelper networkHelper,
      Duration maxStale,
      bool forceRefresh,
      bool? checkInternet) {
    networkHelper.dio.interceptors.add(DioCacheInterceptor(
        options: CacheOptions(
            store: HiveCacheStore(path),
            maxStale: maxStale,
            priority: CachePriority.high,
            policy: checkInternet == true && forceRefresh == true
                ? CachePolicy.refreshForceCache
                : CachePolicy.forceCache)));
  }
}
