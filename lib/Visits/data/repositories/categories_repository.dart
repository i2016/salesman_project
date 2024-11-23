import 'dart:convert';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/config.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Base/network/network_util.dart';
import 'package:water/Visits/data/models/category_model.dart';

class CategoriesRepository{

  Future<CategoryModel?> getCategories() async {
    Map<String, String> headers = {
      'lang': LocalizeAndTranslate.getLanguageCode(),
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': LocalizeAndTranslate.getLanguageCode() == 'ar' ? 'ar-EG' : 'en-EG',

    };
    return NetworkUtil.internal().post(
      CategoryModel(),
      baseUrl + categoriesUrl,
      headers: headers ,
      body: jsonEncode( {
        "params":{
          "visit_id": await sharedPreferenceManager.readString(CachingKey.VISIT_ID)
        }
      }),);
  }



}
final CategoriesRepository categoriesRepository = CategoriesRepository();