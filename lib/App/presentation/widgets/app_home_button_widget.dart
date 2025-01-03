import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/theme.dart';

class AppButtonWidget extends StatelessWidget{
  final String asset;
  final String text;
  Function() onClick;
  final Color color;
  AppButtonWidget({required this.text , required this.asset, required this.onClick,this.color = kBlackColor});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: LocalizeAndTranslate.getLanguageCode() == 'en'
        ? TextDirection.rtl
        : TextDirection.ltr,
    child:  Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: color == kBlackColor ? kBlackColor : kWhiteColor,
            borderRadius: BorderRadius.circular(8),
          border: Border.all(color:  kBlackColor)
        ),
        padding: EdgeInsets.all(3),
        child: TextButton(
          clipBehavior: Clip.hardEdge,
          onPressed: onClick,
          child: Row(
            children: [
              Image.asset(
                asset,
                color: color == kBlackColor ?  kWhiteColor : kBlackColor ,
                scale: 1.3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.008,
              ),
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: color == kBlackColor ?  kWhiteColor : kBlackColor
                ),
              ),
            ],
          ),
        ),
      ),
    ), );
  }
}