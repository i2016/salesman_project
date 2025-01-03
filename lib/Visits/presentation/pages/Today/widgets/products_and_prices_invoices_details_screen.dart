import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Visits/presentation/pages/Today/review_returned_products_screen.dart';

class ProductsAndPricesInvoicesDetailsScreen extends StatelessWidget {
  const ProductsAndPricesInvoicesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          InkWell(
            onTap: (){
            //  if(Shared.returns_products_list.length !=0)
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ReviewReturnedProductsScreen()),
                );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.23,
              height: MediaQuery.of(context).orientation == Orientation.portrait ?
              MediaQuery.of(context).size.height * 0.041
                  : MediaQuery.of(context).size.height * 0.072,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/images/CheckCircle.png',
                        color: Colors.blue
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.006,
                    ),
                     Text(
                      "review_products".tr(),
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
