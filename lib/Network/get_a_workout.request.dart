part of funxtion_sdk;

class GetWorkoutRequest {
  Future<WorkoutModel?> getWorkoutById(String id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getWorkoutApi + id,
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      WorkoutModel m = WorkoutModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
