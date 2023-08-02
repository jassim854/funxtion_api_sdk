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

  Future<Response> postAuthRequest(
      {required String username,
      required String password,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.post(
      ConstantApis.loginApi,
      data: {"username": username, "password": password},
      options: buildCacheOptions(maxAge, forceRefresh: forceRefresh),
    );
  }

  Future<Response> getListOfExerciseRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.get(ConstantApis.listExerciseApi,
        queryParameters: queryParameters,
        options: buildCacheOptions(maxAge,
            forceRefresh: forceRefresh, maxStale: maxStale));
  }

  Future<Response> getExerciseByIdRequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getExerciseApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfWorkoutRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ConstantApis.listWorkoutApi,
      queryParameters: queryParameters,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getWorkoutByIdRequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getWorkoutApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfTrainingPlanRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(
      ConstantApis.listTrainingPlanApi,
      queryParameters: queryParameters,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getTrainingPlanByIdRequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getTrainingPlanApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfEquipmentRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ConstantApis.listEquipmentApi,
      queryParameters: queryParameters,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getEquipmentByIdReques(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getEquipmentApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfFitnessGoalRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ConstantApis.listFitnessGoalApi,
      queryParameters: queryParameters,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getFitnessGoalByIdRequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getFitnessGoalApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfInstructorsRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.listInstructorApi,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getInstructorByIdRequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getInstructorApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOnDemandRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ConstantApis.listOnDemandApi,
      queryParameters: queryParameters,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getOnDemandByIdRequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getOnDemandApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfContentProviderRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.listContentProvidersApi,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfContentCategoryRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.listContentCategoryApi,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOnDemandCategoriesRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ConstantApis.listOnDemandCategoryApi,
      queryParameters: queryParameters,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfMuscleGroupRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ConstantApis.listMuscleGroupApi,
      queryParameters: queryParameters,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getFitnessActivitiesTypeRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getFitnessActivitiesTypeApi,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getFitnessActivityTypeByIdrequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getFitnessActivityTypeApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getBodyPartsRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale,
      Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ConstantApis.getBodyPartsApi,
      queryParameters: queryParameters,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getABodyPartById(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getABodyPartsApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfContentPackageRequest(
      {required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.listContentPackagesApi,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getContentPackageById(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getContentPackagesApi + id,
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListContentPackageItemRequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      "${ConstantApis.listContentPackageItemApi}$id/items",
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }
}
