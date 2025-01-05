import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';
import 'package:water/Dashboard/data/models/dashboard_model.dart';

class DashboardRepository{

  Future<DashboardModel?> getDashboardData() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      DashboardModel(),
      baseUrl + dashboardUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID),
        }
      }),);
  }



}
final DashboardRepository dashboardRepository = DashboardRepository();