part of funxtion_sdk;

class ExerciseRequest {
  static Future<List<ExerciseModel>?> listOfExercise(
      {Duration? maxAge, bool? forceRefresh, Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();

    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfExerciseRequest(
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh??true,
          maxStale: maxStale);

      if (response.statusCode == 200) {
        List<ExerciseModel> data = List<ExerciseModel>.from(
            response.data["data"].map((x) => ExerciseModel.fromJson(x)));

        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
    return null;
  }

  static Future<ExerciseModel?> exerciseById(
      {required String id,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getExerciseByIdRequest(
          id: id,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh??true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        ExerciseModel data = ExerciseModel.fromJson(response.data);
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
    return null;
  }
}
