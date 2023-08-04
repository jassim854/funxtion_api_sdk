import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../funxtion_sdk.dart';

class BodyPartsRequest {
  static Future<List<BodyPartModel>?> bodyParts({
    Duration? maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereNameContains,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereSlugNameIsEqualTo,
  }) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getBodyPartsRequest(
        maxAge: maxAge ?? const Duration(days: 7),
        forceRefresh: forceRefresh ?? true,
        maxStale: maxStale,
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
      if (response.statusCode == 200) {
        List<BodyPartModel> data = List.from(
            response.data['data'].map((e) => BodyPartModel.fromJson(e)));

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future<BodyPartModel?> bodyPartById(
      {required String id,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getABodyPartById(
          id: id,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        BodyPartModel data = BodyPartModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
