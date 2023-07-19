part of funxtion_sdk;

class GetFitnessActivityTypeRequest {
  Future<FitnessActivityTypeModel?> getFtinessActivityTypeById(
      String id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getFitnessActivityTypeApi + id,
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      FitnessActivityTypeModel m =
          FitnessActivityTypeModel.fromJson(response.data);

      return m;
    }
    return null;
  }
}
