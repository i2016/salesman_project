import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Visits/presentation/pages/Today/review_product_screen.dart';

class ProductsAndPricesAvailableItemsScreen extends StatelessWidget {
  bool? visitCategory;
   ProductsAndPricesAvailableItemsScreen({super.key,this.visitCategory = false});

  @override
  Widget build(BuildContext context) {
    return       visitCategory! ? Container() :  Container(
      width: MediaQuery.of(context).size.width * 0.245,

      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

      InkWell(
              onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ReviewProductScreen()));
              },
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  height: MediaQuery.of(context).orientation == Orientation.portrait ?
                  MediaQuery.of(context).size.height * 0.041
                      :  MediaQuery.of(context).size.height * 0.065,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xff1D7AFC),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/CheckCircle.png',
                            color: Color(0xff1D7AFC)
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
                        ),
                         Text(
                          "review_products".tr(),
                          style: TextStyle(
                            color: Color(0xff1D7AFC),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    }


}
