part of funxtion_sdk;

class GetTrainingPlanRequest {
  Future<TrainingPlanModel?> getTrainingPlanById(String id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getTrainingPlanApi + id,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      TrainingPlanModel m = TrainingPlanModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
