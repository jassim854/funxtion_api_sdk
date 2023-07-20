part of funxtion_sdk;

class ListWorkoutRequest {
  Future<List<WorkoutModel>?> getListOfWorkouts() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.listWorkoutApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<WorkoutModel> m =
          List.from(response.data['data'].map((e) => WorkoutModel.fromJson(e)));
      return m;
    }
    return null;
  }
}
