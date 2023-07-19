part of funxtion_sdk;

class GetAExerciseRequest {
  Future<ExerciseModel?> getExerciseById(String id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getExerciseApi + id,
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      ExerciseModel m = ExerciseModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
