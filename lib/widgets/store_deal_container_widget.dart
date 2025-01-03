import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/widgets/container_in_store_deal_container.dart';

class StoreDealContainer extends StatelessWidget {
  const StoreDealContainer({super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          MediaQuery.of(context).orientation == Orientation.portrait ?
          Container(
            width: MediaQuery.of(context).size.width * 0.24,
            height: MediaQuery.of(context).size.height * 0.32,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
               "transaction_started_with".tr(),
                    style: TextStyle(
                        color: Color(0xff25292E),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                   Opacity(
                    opacity: 0.7,
                    child: Text(
                      "merchant_name".tr(),
                      style: TextStyle(
                          color: Color(0xff25292E),
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                   ContainerInStoreDealContainer(
                    name: "sell".tr(), image: 'assets/images/IconWrapperrrrr.png', color: Colors.white,
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.011,
                  ),
                   ContainerInStoreDealContainer(
                    name:"good_return".tr(), image: 'assets/images/RestartCircle.png', color: Colors.white,
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.011,
                  ),
                   ContainerInStoreDealContainer(
                    name: "bad_return".tr(), image: 'assets/images/badReturned.png', color: Colors.white,
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.011,
                  ),
                   ContainerInStoreDealContainer(
                    name: "collection".tr(), image: 'assets/images/MoneyBag.png', color: Colors.white,
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.011,
                  ),
                   ContainerInStoreDealContainer(
                    name: "photos".tr(), image: 'assets/images/camera.png', color:Colors.white ,
                    ),
                ],
              ),
            ),
          )
          : Container(
            width: MediaQuery.of(context).size.width * 0.24,
            height: MediaQuery.of(context).size.height * 0.46,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "transaction_started_with".tr(),
                    style: TextStyle(
                        color: Color(0xff25292E),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                   Opacity(
                    opacity: 0.7,
                    child: Text(
                     "merchant_name".tr(),
                      style: TextStyle(
                          color: Color(0xff25292E),
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                   ContainerInStoreDealContainer(
                    name: "sell".tr(), image: 'assets/images/IconWrapperrrrr.png', color: Colors.white,
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.011,
                  ),
                   ContainerInStoreDealContainer(
                    name: "good_return".tr(), image: 'assets/images/RestartCircle.png', color: Colors.white,
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.011,
                  ),
                   ContainerInStoreDealContainer(
                    name: "bad_return".tr(), image: 'assets/images/badReturned.png', color: Colors.white,
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.011,
                  ),
                   ContainerInStoreDealContainer(
                    name: "collection".tr(), image: 'assets/images/MoneyBag.png', color: Colors.white,
                    ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.011,
                  ),
                   ContainerInStoreDealContainer(
                    name: "photos".tr(), image: 'assets/images/camera.png', color:Colors.white ,
                    ),
                ],
              ),
            ),
          )
        ],
      );
  }
}
