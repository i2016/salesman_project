import 'package:flutter/material.dart';
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
              if(Shared.returns_products_list.length !=0)
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
                    const Text(
                      'مراجعة المنتجات',
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
     /*     Container(
            width: MediaQuery.of(context).size.width * 0.245,
            height: MediaQuery.of(context).orientation == Orientation.portrait ?
           MediaQuery.of(context).size.height * 0.184
           : MediaQuery.of(context).size.height * 0.292,
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
                  const Text(
                    'مرتجع منتجات',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'لأسم التاجر',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          '4*مياه',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                                '42 ر.س',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                fontSize: 14,
                                ),
                              ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          '2*مياه',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                                '42 ر.س',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                fontSize: 14,
                                ),
                              ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          '25*مياه',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                                '42 ر.س',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                fontSize: 14,
                                ),
                              ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          '2*مياه',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                                '42 ر.س',
                                style: TextStyle(
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Opacity(
                            opacity: 0.7,
                            child: Text(
                              'الاجمالي',
                              style: TextStyle(
                                color: Color(0xff0056C9),
                                fontSize: 16,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.9,
                            child: Text(
                              '42 ر.س',
                              style: TextStyle(
                                color: Color(0xff0056C9),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.012,
                      ),
                      InkWell(
                        onTap: (){
                          if(Shared.returns_products_list.length !=0)
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
                              const Text(
                                'مراجعة المنتجات',
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
                      ),
                    ],
                  ),
            ),
          ),*/
        ],
      ),
    );
  }
}
