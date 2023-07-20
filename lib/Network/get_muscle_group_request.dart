part of funxtion_sdk;

class GetMuscleGroupRequest {
  Future<MuscleGroupsModel?> getMuscleGroupById(int id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getMuscleGroupApi + id.toString(),
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      MuscleGroupsModel m = MuscleGroupsModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
