import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Clients/data/models/add_client_response_model.dart';
import 'package:water/Clients/data/models/client_add_requests_model.dart';
import 'package:water/Clients/data/models/clients_model.dart';

class ClientsRepository{

  Future<AddClientResponseModel?> addClient() async {
    print("1");
    // Define request headers
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',
    };

    print("2");
    List<String> validImages = Shared.images_list.where((image) => image != null && image.isNotEmpty).toList();    // Create payment list for the request body
    print("3");
    // Create request body
    var body = jsonEncode({
      "params": {
        "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID),
        "customer_name": Shared.addMerchantName,
        "phone":Shared.addMerchantPhone,
        "email": Shared.addMerchantEmail,
        "shop_name": Shared.addStoreName,
        "tax_id": Shared.addStoreVatNumber,
        "register_number": Shared.addStoreRegisterationNumber,
        "website": Shared.addStoreWebsite,
        "city_id": 278,
        "post_number":Shared.addStoreLocationPostCode,
        "street": Shared.addStoreLocationRegion,
        "street2": Shared.addStoreName,
        "building": Shared.addStoreLocationBuildingNo,
        "long": Shared.addStoreLocationLongtitude,
        "lat": Shared.addStoreLocationLatitude,
        "documents": validImages
      }
    });
    print("4");
    // Make the network request
    return await NetworkUtil.internal().post(
      AddClientResponseModel(),
      baseUrl + addClientUrl,
      headers: headers,
      body: body,
    );
  }

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