import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Visits/data/models/category_model.dart';

class SearchTextFieldAvailableProductsScreen extends StatelessWidget {
  CategoryData? categoryData;
  SearchTextFieldAvailableProductsScreen({super.key,this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.019,
                          ),
                           Text(
                            "water_item_available".tr(),
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.019,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.033,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                               categoryData == null ? '' :     '${categoryData!.name}',
                              style: TextStyle(
                                color: Color(0xff25292E),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/marketImage.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.024,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.002,
                                    ),
                                     Text(
                                      categoryData == null ? '' :     '${categoryData!.productCount} منتج ',
                                      style: TextStyle(
                                          color: Color(0xff0056C9),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.033,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.5),
                        child: TextField(
                          cursorColor: Color.fromARGB(255, 66, 64, 64),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              prefixIcon: Image.asset(
                                'assets/images/search.png',
                                color: Colors.black,
                              ),
                              hintText: "search_for_a_product".tr(),
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 146, 155, 171),
                              )),
                        ),
                      )),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.012,
                      ),
                      const Text(
                        'المنتجات المتاحة',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.019,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.045,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                              "water".tr(),
                              style: TextStyle(
                                color: Color(0xff25292E),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/marketImage.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.014,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.002,
                                    ),
                                     Text(
                                      "50_products".tr(),
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
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.053,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.5),
                        child: TextField(
                          cursorColor: Color.fromARGB(255, 66, 64, 64),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              prefixIcon: Image.asset(
                                'assets/images/search.png',
                                color: Colors.black,
                              ),
                              hintText: "search_for_a_product".tr(),
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 146, 155, 171),
                              )),
                        ),
                      )),
                ],
              )
      ],
    );
  }
}
