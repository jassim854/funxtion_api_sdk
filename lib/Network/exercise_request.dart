part of funxtion_sdk;

class ExerciseRequest {
  static Future<List<ExerciseModel>?> getListOfExercise() async {
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await dio.get(
        ConstantApis.listExerciseApi,
        options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
      );
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

  static Future<ExerciseModel?> getExerciseById(String id) async {
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await dio.get(
        ConstantApis.getExerciseApi + id,
        options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
      );
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
