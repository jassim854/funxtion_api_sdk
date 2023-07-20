part of funxtion_sdk;

class GetInstructorRequest {
  Future<InstructorModel?> getInstructorsById(String id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getInstructorApi + id,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      InstructorModel m = InstructorModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
