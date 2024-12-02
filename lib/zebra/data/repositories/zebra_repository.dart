import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Clients/data/models/invoice_history_model.dart';
import 'package:water/zebra/data/models/receipt_model.dart';

class ZebraRepository{

  Future<RecieptModel?> getReceiptData() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().get(
      RecieptModel(),
     "https://api.npoint.io/ee2f248feeb537ff25f4", // baseUrl + invoiceHistoryUrl,
      headers: headers ,
     /* body: jsonEncode( {
        "params":{
          "visit_id": await sharedPreferenceManager.readString(CachingKey.VISIT_ID)
        }
      }),*/);
  }




}
final ZebraRepository zebraRepository = ZebraRepository();