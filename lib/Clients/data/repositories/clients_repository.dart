import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Clients/data/models/client_add_requests_model.dart';
import 'package:water/Clients/data/models/clients_model.dart';

class ClientsRepository{
  Future<ClientsModel?> getAllClients() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      ClientsModel(),
      baseUrl + getAllClientsUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID)
        }
      }),);
  }

  Future<ClientAddRequestsModel?> getClientAddRequest() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      ClientAddRequestsModel(),
      baseUrl + getClientAddRequestUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID)
        }
      }),);
  }
}
final ClientsRepository clientsRepository = ClientsRepository();