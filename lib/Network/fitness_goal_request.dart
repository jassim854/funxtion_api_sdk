
part of funxtion_sdk;

class FitnessGoalRequest {
  Future<List<FitnessGoalModel>?> listOfFitnessGoal({ Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfFitnessGoalRequest(maxAge: maxAge??const Duration(days: 7),forceRefresh: forceRefresh??true,maxStale: maxStale);
      if (response.statusCode == 200) {
        List<FitnessGoalModel> data = List.from(
            response.data['data'].map((e) => FitnessGoalModel.fromJson(e)));

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  Future<FitnessGoalModel?> fitnessGoalById({required String id, Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getFitnessGoalByIdRequest(id: id,maxAge: maxAge??const Duration(days: 7),forceRefresh: forceRefresh??true,maxStale: maxStale);
      if (response.statusCode == 200) {
        FitnessGoalModel data = FitnessGoalModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
