

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../funxtion_sdk.dart';

class InstructorRequest {
  static Future<List<InstructorModel>?> listOfInstructors(
      {Duration? maxAge, bool? forceRefresh, Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
   DioCacheManager   dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getListOfInstructorsRequest(
        maxAge: maxAge ?? const Duration(days: 7),
        forceRefresh: forceRefresh ?? true,
        maxStale: maxStale,
      );
      if (response.statusCode == 200) {
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
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
    DioCacheManager  dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getInstructorByIdRequest(
          id: id,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        InstructorModel data = InstructorModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
