import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Returns/data/models/invoices_details_model.dart';

class InvoicesDetailsRepository {

  Future<InvoicesDetailsModel?> getInvoiceDetails() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      InvoicesDetailsModel(),
      baseUrl + invoicesDetailsUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "invoice_id": await sharedPreferenceManager.readString(CachingKey.INVOICE_ID)
        }
      }),);
  }

}

final InvoicesDetailsRepository invoicesDetailsRepository = InvoicesDetailsRepository();