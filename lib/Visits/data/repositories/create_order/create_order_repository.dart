import 'dart:convert';
import 'dart:ffi';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';

class CreateOrderRepository{

  Future<CreateOrderResponseModel?> createOrder() async {
    // Define request headers
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',
    };

    // Create items list for the request body
    List<Map<String, dynamic>> items = Shared.order_products_list.map((product) {
      return {
        "product_id":  product.id,
        "quantity":  int.parse(product.selectedCount.toString()),
        "price":  double.parse(product.price.toString()),
        "uom_id" : product.unit!.id
      };
    }).toList();


    List<String> validImages = Shared.images_list.where((image) => image != null && image.isNotEmpty).toList();    // Create payment list for the request body
    List<Map<String, dynamic>> paymentList = Shared.orderPaymentList.map((payment) {
      print("payment.amount : ${payment.amount} , ${payment.amount.runtimeType}");
      print("payment.amount : ${payment.method} , ${payment.method.runtimeType}");
      return {
        "amount": double.parse(Shared.convertToStandardDigits(payment.amount.toString().trim())),
        "method":  payment.method,
        "documents": validImages,
            };
    }).toList();

    // Create request body
    var body = jsonEncode({
      "params": {
        "visit_id": await sharedPreferenceManager.readString(CachingKey.VISIT_ID),
        "salesman_id": await sharedPreferenceManager.readInt(CachingKey.USER_ID),
        "items": items,
        "payments": paymentList,
      }
    });

    // Make the network request
    return await NetworkUtil.internal().post(
      CreateOrderResponseModel(),
      baseUrl + createOrderUrl,
      headers: headers,
      body: body,
    );
  }



}
final CreateOrderRepository createOrderRepository = CreateOrderRepository();