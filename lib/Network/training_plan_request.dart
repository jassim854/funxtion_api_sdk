
part of funxtion_sdk;

class TrainingPlanRequest {
 static Future<List<TrainingPlanModel>?> listOfTrainingPlan() async {
       NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
        _dioCacheManager = DioCacheManager(CacheConfig());
    netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await netwoerkHelper.getListOfTrainingPlanRequest();
    if (response.statusCode == 200) {
      List<TrainingPlanModel> data = List.from(
          response.data['data'].map((e) => TrainingPlanModel.fromJson(e)));
      return data;
    }
    } on DioError catch (e) {
     throw convertDioErrorToRequestException(e);
    }
 
  
    return null;
  }

 static Future<TrainingPlanModel?> trainingPlanById(String id) async {
    NetwoerkHelper netwoerkHelper=NetwoerkHelper();
    try {
       _dioCacheManager = DioCacheManager(CacheConfig());
   netwoerkHelper. dio.interceptors.add(_dioCacheManager?.interceptor);
    var response =await netwoerkHelper.getTrainingPlanByIdRequest( id);
    if (response.statusCode == 200) {
      TrainingPlanModel data = TrainingPlanModel.fromJson(response.data);
      return data;
    }
    } on DioError catch (e) {
       throw convertDioErrorToRequestException(e);
    }
   
    return null;
  }
}
