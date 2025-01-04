import 'package:flutter/material.dart';
import 'package:water/Base/common/theme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
/*
class LinearProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: kInactiveColor)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'مبيعات يوم الاثنين 2024/5/28',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15, // Adjust width as needed
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: ImageIcon(
                          AssetImage("assets/images/BillList.png"), color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16.0,
                  top: 10.0,
                  child: Text(
                    '250,000',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'نسبة 100% من المطلوب',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF0056C9),
                    fontWeight: FontWeight.w500,
                  ),

                ),
                Text(
                  '25,000 ر.س',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

class LinearProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: kInactiveColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'sales_on_monday'.tr(),  // Use localized key with date passed as argument
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15, // Adjust width as needed
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: ImageIcon(
                          AssetImage("assets/images/BillList.png"), color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16.0,
                  top: 10.0,
                  child: Text(
                    '250,000',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'progress_percentage'.tr(),  // Localized progress message
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF0056C9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '25000_rial'.tr(),  // Localized currency value
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


