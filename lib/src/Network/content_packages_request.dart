import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../funxtion_sdk.dart';

class ContentPackageRequest {
  static Future<List<ContentPackageModel>?> listOfContentPackages(
      {Duration? maxAge, bool? forceRefresh, Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getListOfContentPackageRequest(
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        List<ContentPackageModel> m = List.from(
            response.data['data'].map((e) => ContentPackageModel.fromJson(e)));
        return m;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future<ContentPackageModel?> contentPackagetById(
      {required String id,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getContentPackageById(
          id: id,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        ContentPackageModel data = ContentPackageModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
