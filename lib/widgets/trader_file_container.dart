import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class TraderFileContainer extends StatelessWidget {
  const TraderFileContainer(
      {super.key,
      required this.traderName,
      required this.phone,
      required this.textSmallContainer,
      required this.iconSmallContainer,
      required this.color});

  final String traderName;
  final String phone;
  final String textSmallContainer;
  final String iconSmallContainer;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.1
          : MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                     Text(
                      "merchant_file".tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.008,
                    ),
                    Container(
                     /* width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.14
                          : MediaQuery.of(context).size.width * 0.09,*/
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.019
                          : MediaQuery.of(context).size.height * 0.032,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 243, 243, 244),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          children: [
                            Image.asset(
                              iconSmallContainer,
                              color: color
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.004,
                            ),
                             Text(
                              textSmallContainer,
                              style: TextStyle(
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/User.png',
                  color: const Color(0xffDCDFE3),
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.032
                          : MediaQuery.of(context).size.height * 0.044,
                ),
              ],
            ),
             Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Opacity(
                            opacity: 0.7,
                            child: Text(
                          "merchant_name".tr(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff25292E)),
                            ),
                          ),
                          Text(
                            traderName,
                          maxLines: 4,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Opacity(
                          opacity: 0.7,
                          child: Text(
                            "phone".tr(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff25292E)),
                          ),
                        ),
                        Text(
                         phone,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
