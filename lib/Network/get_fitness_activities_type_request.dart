part of funxtion_sdk;

class GetFitnessActivitiesTypeRequest {
  Future<List<FitnessActivityTypeModel>?> getFtinessActivitiesType() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getFitnessActivitiesTypeApi,
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<FitnessActivityTypeModel> m = List.from(response.data['data']
          .map((e) => FitnessActivityTypeModel.fromJson(e)));

      return m;
    }
    return null;
  }
}
