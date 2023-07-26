part of funxtion_sdk;

class FitnessActivityTypeRequest {
  static Future<List<FitnessActivityTypeModel>?> listOfFtinessActivitiesType(
      {Duration? maxAge, bool? forceRefresh, Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getFitnessActivitiesTypeRequest(
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        List<FitnessActivityTypeModel> data = List.from(response.data['data']
            .map((e) => FitnessActivityTypeModel.fromJson(e)));

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future<FitnessActivityTypeModel?> ftinessActivityTypeById(
      {required String id,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getFitnessActivityTypeByIdrequest(
          id: id,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        FitnessActivityTypeModel data =
            FitnessActivityTypeModel.fromJson(response.data);

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
