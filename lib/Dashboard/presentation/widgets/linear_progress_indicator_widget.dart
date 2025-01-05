import 'package:flutter/material.dart';
import 'package:water/Base/common/theme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:intl/intl.dart' as intl;

class LinearProgressIndicatorWidget extends StatelessWidget {
  final double target;
  final double sales;

  LinearProgressIndicatorWidget({required this.target, required this.sales});

  @override
  Widget build(BuildContext context) {
    print("sales: $sales");
    print("target: $target");

    double progress = (target > 0) ? (sales / target).clamp(0.0, 1.0) : 0.0;

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
                "${"sales_on_month".tr()} ${intl.DateFormat.MMMM().format(DateTime.now())}",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Stack(
              children: [
                // Background container for the progress bar
                Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                // Progress bar indicator
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: progress, // Use calculated progress value
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.045,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
                // Text displaying the progress value
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      target > 0
                          ? '${(progress * 100).toInt()}%'
                          : '0%', // Display 0% if target is 0
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kBlueColor,
                        fontWeight: FontWeight.bold,

                      ),
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
                  "${(progress * 100).toInt()}%  ${'progress_percentage'.tr()}",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF0056C9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${target.toStringAsFixed(2)} ${"sar".tr()}",
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
