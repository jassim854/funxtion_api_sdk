import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../funxtion_sdk.dart';

class FitnessActivityTypeRequest {
  static Future<List<Map<String, dynamic>>?> listOfFtinessActivitiesType(
      {bool forceRefresh = true,
      Duration maxStale = const Duration(days: 7)}) async {
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
        response = await netwoerkHelper.getFitnessActivitiesTypeRequest();
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(
            value.path,
            netwoerkHelper,
            maxStale,
            forceRefresh,
            checkInternet,
          );
        });
        response = await netwoerkHelper.getFitnessActivitiesTypeRequest();
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        return await compute(ResponseConstants.convertResponseList, response);
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future<Map<String, dynamic>?> ftinessActivityTypeById(
      {required String id,
      Duration? maxAge,
      bool forceRefresh = true,
      Duration maxStale = const Duration(days: 7)}) async {
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
        response = await netwoerkHelper.getFitnessActivityTypeByIdrequest(
          id: id,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(
            value.path,
            netwoerkHelper,
            maxStale,
            forceRefresh,
            checkInternet,
          );
        });
        response = await netwoerkHelper.getFitnessActivityTypeByIdrequest(
          id: id,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        return await compute(ResponseConstants.convertResponse, response);
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
            allowPostMethod: true,
            maxStale: maxStale,
            priority: CachePriority.high,
            policy: checkInternet == true && forceRefresh == true
                ? CachePolicy.refreshForceCache
                : CachePolicy.forceCache)));
  }
}
