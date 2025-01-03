import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class StoreNameContainer extends StatelessWidget {
  const StoreNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.035
          : MediaQuery.of(context).size.height * 0.055,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/smallShop.png',
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.013
                        : MediaQuery.of(context).size.height * 0.024),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.008,
                ),
                 Text(
                  "storeName".tr(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 245, 245),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/distanceImage.png',
                      height: MediaQuery.of(context).size.height * 0.014,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.008,
                    ),
                     Text(
                      '${"Far_away".tr()} 232 ${"km".tr()}',
                      style: TextStyle(
                          color: Color(0xff0056C9),
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
