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

  Future<Response> getListOfExerciseRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereExerciseNameContains,
    String? whereLevelFieldEqualTo,
    String? whereEquipmentIdsAre,
    String? whereEquipmentBrandsAre,
    String? whereOrientationIsEqualTo,
    String? whereMuscleGroupIdsAre,
    String? whereContentCategoriesIdsAre,
    String? whereGoalMetricsIsEqualTo,
    String? whereInstructorGenderIsEqualTo,
    String? whereResistanceMetricsIsEqualTo,
    String? whereEquipmentIdIsEqualTo,
    String? whereEquipmentBrandsIsEqualTo,
    String? whereMuscleGroupIdIsEqualTo,
    String? whereContentCategoriesIdIsEqualTo,
  }) async {
    return await dio.get(ConstantApis.listExerciseApi,
        queryParameters: {
          if (whereOrderingAccordingToNameEqualTo != null)
            "filter[order][name]": whereOrderingAccordingToNameEqualTo,
          if (whereLimitContentPerPageIsEqualTo != null)
            "filter[limit]": whereLimitContentPerPageIsEqualTo,
          if (wherePageNumberIsEqualTo != null)
            "filter[offset]": wherePageNumberIsEqualTo,
          if (whereExerciseNameContains != null)
            "filter[where][q][contains]": whereExerciseNameContains,
          if (whereLevelFieldEqualTo != null)
            "filter[where][level][eq]": whereLevelFieldEqualTo,
          if (whereEquipmentIdsAre != null)
            "filter[where][equipment.ids][in]": whereEquipmentIdsAre,
          if (whereEquipmentIdIsEqualTo != null)
            "filter[where][equipment.ids][eq]": whereEquipmentIdIsEqualTo,
          if (whereEquipmentBrandsAre != null)
            "filter[where][equipment.brand][in]": whereEquipmentBrandsAre,
          if (whereEquipmentBrandsIsEqualTo != null)
            "filter[where][equipment.brand][eq]": whereEquipmentBrandsIsEqualTo,
          if (whereOrientationIsEqualTo != null)
            "filter[where][orientation][contains]": whereOrientationIsEqualTo,
          if (whereMuscleGroupIdsAre != null)
            "filter[where][muscle_groups.ids][in]": whereMuscleGroupIdsAre,
          if (whereMuscleGroupIdIsEqualTo != null)
            "filter[where][muscle_groups.ids][eq]": whereMuscleGroupIdIsEqualTo,
          if (whereContentCategoriesIdsAre != null)
            "filter[where][content_categories.ids][in]":
                whereContentCategoriesIdsAre,
          if (whereContentCategoriesIdIsEqualTo != null)
            "filter[where][content_categories.ids][eq]":
                whereContentCategoriesIdIsEqualTo,
          if (whereGoalMetricsIsEqualTo != null)
            "filter[where][goal metrics][contains]": whereGoalMetricsIsEqualTo,
          if (whereInstructorGenderIsEqualTo != null)
            "filter[where][instructor_gender][contains]":
                whereInstructorGenderIsEqualTo,
          if (whereResistanceMetricsIsEqualTo != null)
            "filter[where][resistance metrics][contains]":
                whereResistanceMetricsIsEqualTo
        },
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

  Future<Response> getListOfWorkoutRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereWorkoutNameContains,
    String? whereGoalIdsAre,
    String? whereLevelFieldEqualTo,
    String? whereBodyPartsIdsAre,
    String? whereDurationIsEqualTo,
    String? whereGoalIdIsEqualTo,
    String? whereBodyPartIdIsEqualTo,
    String? whereTypeIdIsEqualTo,
    String? whereTypeIdsAre,
    String? whereLocationIsEqualTo,
  }) async {
    return await dio.get(
      ConstantApis.listWorkoutApi,
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereWorkoutNameContains != null)
          "filter[where][q][contains]": whereWorkoutNameContains,
        if (whereLevelFieldEqualTo != null)
          "filter[where][level][eq]": whereLevelFieldEqualTo,
        if (whereGoalIdsAre != null)
          "filter[where][goals][in]": whereGoalIdsAre,
        if (whereGoalIdIsEqualTo != null)
          "filter[where][goals][eq]": whereGoalIdIsEqualTo,
        if (whereBodyPartsIdsAre != null)
          "filter[where][body_parts][in]": whereBodyPartsIdsAre,
        if (whereBodyPartIdIsEqualTo != null)
          "filter[where][body_parts][eq]": whereBodyPartIdIsEqualTo,
        if (whereDurationIsEqualTo != null)
          "filter[where][duration][eq]": whereDurationIsEqualTo,
        if (whereTypeIdsAre != null)
          "filter[where][types][in]": whereTypeIdsAre,
        if (whereTypeIdIsEqualTo != null)
          "filter[where][types][eq]": whereTypeIdIsEqualTo,
        if (whereLocationIsEqualTo != null)
          "filter[where][location][eq]": whereLocationIsEqualTo,
      },
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
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereGoalIdsAre,
    String? whereLevelFieldEqualTo,
    String? whereGoalIdIsEqualTo,
    String? whereDaysPerWeekIsEqualTo,
    String? whereNameIsEqualTo,
    String? whereLocationIsEqualTo,
  }) async {
    return await dio.get(
      ConstantApis.listTrainingPlanApi,
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereNameIsEqualTo != null)
          "filter[where][q][contains]": whereNameIsEqualTo,
        if (whereLevelFieldEqualTo != null)
          "filter[where][level][eq]": whereLevelFieldEqualTo,
        if (whereGoalIdsAre != null)
          "filter[where][goals][in]": whereGoalIdsAre,
        if (whereGoalIdIsEqualTo != null)
          "filter[where][goals][eq]": whereGoalIdIsEqualTo,
        if (whereDaysPerWeekIsEqualTo != null)
          "filter[where][days_per_week][eq]": whereDaysPerWeekIsEqualTo,
        if (whereLocationIsEqualTo != null)
          "filter[where][location][eq]": whereLocationIsEqualTo,
      },
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

  Future<Response> getListOfEquipmentRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereNameContains,
    String? whereSlugNameIsEqualTo,
  }) async {
    return await dio.get(
      ConstantApis.listEquipmentApi,
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereIdIsEqualTo != null) "filter[where][id][eq]": whereIdIsEqualTo,
        if (whereIdsAre != null) "filter[where][id][in]": whereIdsAre,
        if (whereNameContains != null)
          "filter[where][name][contains]": whereNameContains,
        if (whereSlugNameIsEqualTo != null)
          "filter[where][slug][eq]": whereSlugNameIsEqualTo,
      },
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

  Future<Response> getListOfFitnessEquipmentCategoriesRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereNameContains,
    String? whereSlugNameIsEqualTo,
  }) async {
    return await dio.get(
      ConstantApis.listFitnessEquipmentCategoriesApi,
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereIdIsEqualTo != null) "filter[where][id][eq]": whereIdIsEqualTo,
        if (whereIdsAre != null) "filter[where][id][in]": whereIdsAre,
        if (whereNameContains != null)
          "filter[where][name][contains]": whereNameContains,
        if (whereSlugNameIsEqualTo != null)
          "filter[where][slug][eq]": whereSlugNameIsEqualTo,
      },
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getFitnessEquipmentCategoryRequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getFitnessEquipmentCategoryApi + id,
      queryParameters: {},
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfFitnessGoalRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereNameContains,
    String? whereSlugNameIsEqualTo,
  }) async {
    return await dio.get(
      ConstantApis.listFitnessGoalApi,
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereIdIsEqualTo != null) "filter[where][id][eq]": whereIdIsEqualTo,
        if (whereIdsAre != null) "filter[where][id][in]": whereIdsAre,
        if (whereNameContains != null)
          "filter[where][name][contains]": whereNameContains,
        if (whereSlugNameIsEqualTo != null)
          "filter[where][slug][eq]": whereSlugNameIsEqualTo,
      },
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

  Future<Response> getListOnDemandRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereEquipmentIdIsEqualTo,
    String? whereInstructorsIdsAre,
    String? whereEquipmentIdsAre,
    String? whereDurationIsEqualTo,
    String? whereCategoriesIdsAre,
    String? whereNameIsEqualTo,
    String? whereCategoriesIdIsEqualTo,
    String? whereInstructorsIdIsEqualTo,
    String? whereLocationIsEqualTo,
  }) async {
    return await dio.get(
      ConstantApis.listOnDemandApi,
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereLocationIsEqualTo != null)
          "filter[where][location][eq]": whereLocationIsEqualTo,
        if (whereDurationIsEqualTo != null)
          "filter[where][duration][eq]": whereDurationIsEqualTo,
        if (whereInstructorsIdsAre != null)
          "filter[where][instructor_id][in]": whereInstructorsIdsAre,
        if (whereInstructorsIdIsEqualTo != null)
          "filter[where][instructor_id][eq]": whereInstructorsIdIsEqualTo,
        if (whereCategoriesIdsAre != null)
          "filter[where][categories][in]": whereCategoriesIdsAre,
        if (whereCategoriesIdIsEqualTo != null)
          "filter[where][categories][eq]": whereCategoriesIdIsEqualTo,
        if (whereNameIsEqualTo != null)
          "filter[where][title][contains]": whereNameIsEqualTo,
        if (whereEquipmentIdsAre != null)
          "filter[where][equipment.ids][in]": whereEquipmentIdsAre,
        if (whereEquipmentIdIsEqualTo != null)
          "filter[where][equipment.ids][eq]": whereEquipmentIdIsEqualTo,
      },
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

  Future<Response> getListOnDemandCategoriesRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereNameIsEqualTo,
    String? whereSlugNameIsEqualTo,
  }) async {
    return await dio.get(
      ConstantApis.listOnDemandCategoryApi,
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereIdIsEqualTo != null) "filter[where][id][eq]": whereIdIsEqualTo,
        if (whereIdsAre != null) "filter[where][id][in]": whereIdsAre,
        if (whereNameIsEqualTo != null)
          "filter[where][name][eq]": whereNameIsEqualTo,
        if (whereSlugNameIsEqualTo != null)
          "filter[where][slug][eq]": whereSlugNameIsEqualTo,
      },
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getListOfMuscleGroupRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereNameContains,
    String? whereSlugNameIsEqualTo,
  }) async {
    return await dio.get(
      ConstantApis.listMuscleGroupApi,
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereIdIsEqualTo != null) "filter[where][id][eq]": whereIdIsEqualTo,
        if (whereIdsAre != null) "filter[where][id][in]": whereIdsAre,
        if (whereNameContains != null)
          "filter[where][name][contains]": whereNameContains,
        if (whereSlugNameIsEqualTo != null)
          "filter[where][slug][eq]": whereSlugNameIsEqualTo,
      },
      options: buildCacheOptions(maxAge,
          forceRefresh: forceRefresh, maxStale: maxStale),
    );
  }

  Future<Response> getMuscleGroupByIdRequest(
      {required String id,
      required Duration maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    return await dio.get(
      ConstantApis.getMuscleGroupApi + id,
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

  Future<Response> getBodyPartsRequest({
    required Duration maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereNameContains,
    String? whereSlugNameIsEqualTo,
  }) async {
    return await dio.get(
      ConstantApis.getBodyPartsApi,
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereIdIsEqualTo != null) "filter[where][id][eq]": whereIdIsEqualTo,
        if (whereIdsAre != null) "filter[where][id][in]": whereIdsAre,
        if (whereNameContains != null)
          "filter[where][name][contains]": whereNameContains,
        if (whereSlugNameIsEqualTo != null)
          "filter[where][slug][eq]": whereSlugNameIsEqualTo,
      },
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
