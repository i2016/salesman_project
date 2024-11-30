import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Visits/data/models/today_visits_details_model.dart';
import 'package:water/Visits/data/models/visit_change_stage_model.dart';
import 'package:water/Visits/data/models/visits_history_model.dart';
import 'package:water/Visits/data/models/visits_model.dart';

class VisitsRepository{

  Future<VisitsModel?> getTodayVisits() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
        VisitsModel(),
        baseUrl + todayVisitsUrl,
        headers: headers ,
      body: jsonEncode( {
        "params":{
          "salesman": await sharedPreferenceManager.readInt(CachingKey.USER_ID)
        }
      }),);
  }

  Future<VisitDetailsModel?> getTodayVisitsDetails() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      VisitDetailsModel(),
      baseUrl + todayVisitsDetailsUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "visit_id": await sharedPreferenceManager.readString(CachingKey.VISIT_ID)
        }
      }),);
  }

  Future<VisitsHistoryModel?> getVisitsHistory() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      VisitsHistoryModel(),
      baseUrl + visitsHistoryUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "salesman": await sharedPreferenceManager.readInt(CachingKey.USER_ID)
        }
      }),);
  }

  Future<ChangeVisitStageModel?> changeVisitStage() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      ChangeVisitStageModel(),
      baseUrl + changeVisitStageUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID),
          "visit_id": await sharedPreferenceManager.readString(CachingKey.VISIT_ID),
          "action": "false"
        }
      }),);
  }
}
final visitsRepository = VisitsRepository();