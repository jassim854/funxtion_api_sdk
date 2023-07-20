part of funxtion_sdk;

class ListMuscleGroupRequest {
  Future<List<MuscleGroupsModel>?> getListOfMuscleGroup() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.listMuscleGroupApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<MuscleGroupsModel> m = List.from(
          response.data['data'].map((e) => MuscleGroupsModel.fromJson(e)));

      return m;
    }
    return null;
  }
}
