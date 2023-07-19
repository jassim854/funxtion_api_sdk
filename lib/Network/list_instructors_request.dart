part of funxtion_sdk;

class ListInstructorRequest {
  Future<List<InstructorModel>?> getListOfInstructors() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.listInstructorApi,
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<InstructorModel> m = List.from(
          response.data['data'].map((e) => InstructorModel.fromJson(e)));

      return m;
    }
    return null;
  }
}
