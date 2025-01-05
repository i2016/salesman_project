import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:water/Returns/domain/entities/returns_product_entity.dart';
import 'package:water/Visits/domain/entities/added_product_entity.dart';
import 'package:water/Visits/domain/entities/order_payment_entity.dart';

class Shared {

  static Uint8List base64ToImage(String base64String) {
    return base64Decode(base64String);
  }

  static showLoadingDialog({required BuildContext context}) {
    showDialog(
        context: context,
        useSafeArea: true,
        barrierDismissible: false,
        builder: (ctx) => SpinKitWave(
              color: Colors.white,
              size: 38.0,
            ));
  }

  static dismissDialog({required BuildContext context}) {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  // use thos widget to show loading while waiting data from backend
  static final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );

  // use this function to show message to user
/*  static void showSnackBarView(
      {String? message,
      String? backend_message,
      bool? error_status,
      bool? sigin_button}) {
    var snackBar = SnackBar(
      content: Text(
        backend_message ?? LocalizeAndTranslate.translate(message!),
        style: TextStyle(
          color: error_status! ? kWhiteColor : kGreenColor,
        ),
        textDirection: LocalizeAndTranslate.getLanguageCode() == 'en'
            ? TextDirection.ltr
            : TextDirection.rtl,
      ),
      backgroundColor: error_status ? kRedColor : kWhiteColor,
      action: sigin_button!
          ? SnackBarAction(
              label: LocalizeAndTranslate.translate("ksignin"),
              textColor: kBlackColor,
              onPressed: () {},
            )
          : null,
    );
    // Step 3
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }*/

  static Widget text_widget({String? text, TextStyle? textStyle}) {
    return Row(
      children: [
        Text(
          "$text",
          style: textStyle,
        )
      ],
    );
  }

 static double calculateTotalForAllProducts() {
    double total = 0;
    for (var product in Shared.order_products_list) {
      if (product.total != null) {
        total += product.total!;
      }
    }
    return total;
  }

  static double calculateReturnsTotalForAllProducts() {
    double total = 0;
    for (var product in Shared.returns_products_list) {
      if (product.total != null) {
        total += product.total!;
      }
    }
    return total;
  }

 static String convertToStandardDigits(String input) {
    const arabicIndicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (int i = 0; i < arabicIndicDigits.length; i++) {
      input = input.replaceAll(arabicIndicDigits[i], i.toString());
    }
    return input;
  }

  static double width = ScreenUtil.defaultSize.width;
  static double height = ScreenUtil.defaultSize.height;
  static String userType = "B2C";
  static List<String> images_list = [];
  static List<Asset> assets_list = [];
  static String inventoryCurrentRequeststype = 'editProduct';
  static double marketLatitude = 0.0;
  static double marketLongtitude = 0.0;
  static String marketPhone= '';
  static  String device_token = '';
  static double remainingLimit = 0.0;
  static List<AddedProductEntity> order_products_list = [];

  static List<OrderPaymentEntity> orderPaymentList = [];
  static List<OrderPaymentEntity> collectionPayment = [];

  static List<ReturnsProductEntity> returns_products_list = [];

  //Add Merchant
  static String addMerchantName= '';
  static String addMerchantPhone= '';
  static String addMerchantEmail= '';

  //Add Store
  static String addStoreName= '';
  static String addStoreVatNumber= '';
  static String addStoreRegisterationNumber= '';
  static String addStoreWebsite= '';

//Add Location
  static int addStoreLocationCity = 0;
  static String addStoreLocationRegion= '';
  static String addStoreLocationPostCode= '';
  static String addStoreLocationStreet= '';
  static String addStoreLocationBuildingNo= '';
  static String addStoreLocationLatitude= '';
  static String addStoreLocationLongtitude= '';
}
