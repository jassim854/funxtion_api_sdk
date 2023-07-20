part of funxtion_sdk;

class GetFitnessGoalRequest {
  Future<FitnessGoalModel?> getFitnessGoalById(int id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getFitnessGoalApi + id.toString(),
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      FitnessGoalModel m = FitnessGoalModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
