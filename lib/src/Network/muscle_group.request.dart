import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../funxtion_sdk.dart';

class MuscleGroupRequest {
  static Future<List<MuscleGroupsModel>?> listOfMuscleGroup({
    bool forceRefresh = true,
    Duration maxStale = const Duration(days: 7),

    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereNameContains,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereSlugNameIsEqualTo,
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
                 response = await netwoerkHelper.getListOfMuscleGroupRequest(
        queryParameters: {
          if (whereOrderingAccordingToNameEqualTo != null)
            "filter[order][name]": whereOrderingAccordingToNameEqualTo,
          if (whereLimitContentPerPageIsEqualTo != null)
            "filter[limit]": whereLimitContentPerPageIsEqualTo,
          if (wherePageNumberIsEqualTo != null)
            "filter[offset]": wherePageNumberIsEqualTo,
          if (whereIdIsEqualTo != null)
            "filter[where][id][eq]": whereIdIsEqualTo,
          if (whereIdsAre != null) "filter[where][id][in]": whereIdsAre,
          if (whereNameContains != null)
            "filter[where][name][contains]": whereNameContains,
          if (whereSlugNameIsEqualTo != null)
            "filter[where][slug][eq]": whereSlugNameIsEqualTo,
        },
      );
    } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
           response = await netwoerkHelper.getListOfMuscleGroupRequest(
        queryParameters: {
          if (whereOrderingAccordingToNameEqualTo != null)
            "filter[order][name]": whereOrderingAccordingToNameEqualTo,
          if (whereLimitContentPerPageIsEqualTo != null)
            "filter[limit]": whereLimitContentPerPageIsEqualTo,
          if (wherePageNumberIsEqualTo != null)
            "filter[offset]": wherePageNumberIsEqualTo,
          if (whereIdIsEqualTo != null)
            "filter[where][id][eq]": whereIdIsEqualTo,
          if (whereIdsAre != null) "filter[where][id][in]": whereIdsAre,
          if (whereNameContains != null)
            "filter[where][name][contains]": whereNameContains,
          if (whereSlugNameIsEqualTo != null)
            "filter[where][slug][eq]": whereSlugNameIsEqualTo,
        },
      );
    }
  
      if (response.statusCode == 200|| response.statusCode == 304) {
        List<MuscleGroupsModel> data = List.from(
            response.data['data'].map((e) => MuscleGroupsModel.fromJson(e)));

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
            maxStale: maxStale,
            priority: CachePriority.high,
            policy: checkInternet == true && forceRefresh == true
                ? CachePolicy.refreshForceCache
                : CachePolicy.forceCache)));
  }
}
