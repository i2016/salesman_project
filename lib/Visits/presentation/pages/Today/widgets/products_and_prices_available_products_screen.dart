import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Visits/presentation/pages/Today/review_product_screen.dart';

class ProductsAndPricesAvailableProductsScreen extends StatelessWidget {
  const ProductsAndPricesAvailableProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.245,
            height: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.height * 0.18
            : MediaQuery.of(context).size.height * 0.275,
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
                   Text(
                   "returned_products".tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   Text(
                     "merchant_name".tr(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.78,
                        child: Text(
                          "product".tr(),
                          style: TextStyle(
                            color: Color(0xff758195),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        "amount".tr(),
                        style: TextStyle(
                          color: Color(0xff758195),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 186, 180, 180),
                    thickness: 0.9,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          "total".tr(),
                          style: TextStyle(
                              color: Color(0xff0056C9),
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Opacity(
                        opacity: 0.9,
                        child: Text(
                          '42 ${"sar".tr()}',
                          style: TextStyle(
                              color: Color(0xff0056C9),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.004,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          "previous_balance".tr(),
                          style: TextStyle(
                              color: Color(0xff0056C9),
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Opacity(
                        opacity: 0.9,
                        child: Text(
                          '42 ${"sar".tr()}',
                          style: TextStyle(
                              color: Color(0xff0056C9),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.004,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          "net".tr(),
                          style: TextStyle(
                              color: Color(0xff0056C9),
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Opacity(
                        opacity: 0.9,
                        child: Text(
                          '42 ${"sar".tr()}',
                          style: TextStyle(
                              color: Color(0xff0056C9),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                 SizedBox(
                    height: MediaQuery.of(context).size.height * 0.009,
                  ),
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
          )
          
        ],
      ),
    );
  }
}
