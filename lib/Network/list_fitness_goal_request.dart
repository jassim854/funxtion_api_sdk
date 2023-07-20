part of funxtion_sdk;

class ListFitnessGoalRequest {
  Future<List<FitnessGoalModel>?> getListOfFitnessGoal() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.listFitnessGoalApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<FitnessGoalModel> m = List.from(
          response.data['data'].map((e) => FitnessGoalModel.fromJson(e)));

      return m;
    }
    return null;
  }
}
