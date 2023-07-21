part of funxtion_sdk;

class WorkoutRequest {
static  Future<List<WorkoutModel>?> listOfWorkout() async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfWorkoutRequest();
      if (response.statusCode == 200) {
        List<WorkoutModel> data = List.from(
            response.data['data'].map((e) => WorkoutModel.fromJson(e)));
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }

 static Future<WorkoutModel?> workoutById(String id) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getWorkoutByIdRequest(id);
      if (response.statusCode == 200) {
        WorkoutModel data = WorkoutModel.fromJson(response.data);
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }
}
