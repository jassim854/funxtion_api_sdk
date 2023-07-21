part of funxtion_sdk;

String? token;
DioCacheManager? _dioCacheManager;

class NetwoerkHelper {
  late Dio dio;

  NetwoerkHelper() {
    dio = Dio(BaseOptions(
      baseUrl: "https://api-staging.funxtion.com/v3/",
      headers: {
        "X-Scope": "platform",
        'Content-Type': 'application/json',
        "Authorization": token != null ? "Bearer $token" : ''
      },
    ));
  }

  Future<Response> postAuthRequest(String username, String password) async {
    return await dio.post(
      ConstantApis.loginApi,
      data: {"username": username, "password": password},
      options: buildCacheOptions(
        const Duration(hours: 4),
        forceRefresh: false,
      ),
    );
  }

  Future<Response> getListOfExerciseRequest() async {
    return await dio.get(ConstantApis.listExerciseApi,
        options: buildCacheOptions(
          const Duration(days: 7),
          forceRefresh: true,
        ));
  }

  Future<Response> getExerciseByIdRequest(String id) async {
    return await dio.get(
      ConstantApis.getExerciseApi + id,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
  }

  Future<Response> getListOfWorkoutRequest() async {
    return await dio.get(
      ConstantApis.listWorkoutApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
  }

  Future<Response> getWorkoutByIdRequest(String id) async {
    return await dio.get(
      ConstantApis.getWorkoutApi + id,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
  }

  Future<Response> getListOfTrainingPlanRequest() async {
    return await dio.get(
      ConstantApis.listTrainingPlanApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
  }

  Future<Response> getTrainingPlanByIdRequest(String id) async {
    return await dio.get(
      ConstantApis.getTrainingPlanApi + id,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
  }

  Future<Response> getListOfEquipmentRequest() async {
    return await dio.get(
      ConstantApis.listEquipmentApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
  }

  Future<Response> getEquipmentByIdReques(String id) async {
    return await dio.get(
      ConstantApis.getEquipmentApi + id,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
  }

  Future<Response> getListOfFitnessEquipmentCategoriesRequest() async {
    return await dio.get(
      ConstantApis.listFitnessEquipmentCategoriesApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
  }

  Future<Response> getFitnessEquipmentCategoryRequest(String id) async {
    return await dio.get(
      ConstantApis.getFitnessEquipmentCategoryApi + id,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
  }
}
