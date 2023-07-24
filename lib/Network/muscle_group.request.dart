part of funxtion_sdk;

class MuscleGroupRequest {
  Future<List<MuscleGroupsModel>?> listOfMuscleGroup({ Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfMuscleGroupRequest(maxAge: maxAge??const Duration(days: 7),forceRefresh: forceRefresh??true,maxStale: maxStale);
      if (response.statusCode == 200) {
        List<MuscleGroupsModel> data = List.from(
            response.data['data'].map((e) => MuscleGroupsModel.fromJson(e)));

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  Future<MuscleGroupsModel?> muscleGroupById({required String id, Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getMuscleGroupByIdRequest(id: id,maxAge: maxAge??const Duration(days: 7),forceRefresh: forceRefresh??true,maxStale: maxStale);
      if (response.statusCode == 200) {
        MuscleGroupsModel m = MuscleGroupsModel.fromJson(response.data);
        return m;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
