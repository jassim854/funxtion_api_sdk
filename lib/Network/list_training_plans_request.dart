part of funxtion_sdk;

class ListTrainingPlanRequest {
  Future<List<TrainingPlanModel>?> getListOfTrainingPlans() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.listTrainingPlanApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<TrainingPlanModel> data = List.from(
          response.data['data'].map((e) => TrainingPlanModel.fromJson(e)));
      return data;
    }
    return null;
  }
}
