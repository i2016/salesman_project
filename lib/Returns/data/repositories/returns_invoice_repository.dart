import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';
import 'package:water/Visits/data/models/category_model.dart';
import 'package:water/Visits/data/models/today_visits_details_model.dart';
import 'package:water/Visits/data/models/today_visits_model.dart';

class ReturnsInvoiceRepository{

  Future<InvoiceHistoryModel?> getInvoiceHistory() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      InvoiceHistoryModel(),
      baseUrl + invoiceHistoryUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "visit_id": await sharedPreferenceManager.readString(CachingKey.VISIT_ID)
        }
      }),);
  }



}
final ReturnsInvoiceRepository invoiceHistoryRepository = ReturnsInvoiceRepository();