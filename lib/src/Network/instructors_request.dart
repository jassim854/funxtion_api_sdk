import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../funxtion_sdk.dart';

class InstructorRequest {
  static Future<List<InstructorModel>?> listOfInstructors(
      {Duration? maxAge,
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
        response = await netwoerkHelper.getListOfInstructorsRequest();
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await netwoerkHelper.getListOfInstructorsRequest();
      }

      if (response.statusCode == 200|| response.statusCode == 304) {
        List<InstructorModel> data = List.from(
            response.data['data'].map((e) => InstructorModel.fromJson(e)));

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future<InstructorModel?> instructorsById(
      {required String id,
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
        response = await netwoerkHelper.getInstructorByIdRequest(
          id: id,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await netwoerkHelper.getInstructorByIdRequest(
          id: id,
        );
      }

      if (response.statusCode == 200|| response.statusCode == 304) {
        InstructorModel data = InstructorModel.fromJson(response.data);
        return data;
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