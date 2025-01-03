import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Visits/data/models/today_visits_details_model.dart';
import 'package:water/widgets/files_list_view_item.dart';


class  MarketInformationContainer extends StatelessWidget{
  VisitDetails? visitDetails;
   MarketInformationContainer({super.key, this.container = true,this.visitDetails});

final bool container;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
            height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.335
                          : MediaQuery.of(context).size.height * 0.49,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                           Text(
                             "store_info".tr(),
                          style: TextStyle(
                            color: Color(0xff25292E),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.008,
                        ),
                        container == true ?
                        Container(
                             /*       width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.163
                          : MediaQuery.of(context).size.width * 0.106,*/
                                    height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.019
                          : MediaQuery.of(context).size.height * 0.033,
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
                                  'assets/images/VerifiedCheck.png',
                                  color: const Color(0xff0056C9),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.004,
                                ),
                                 Text(
                                   "customer_since".tr(),
                                  style: TextStyle(
                                      color: Color(0xff0056C9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                        : Container(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Opacity(
                          opacity: 0.2,
                          child: Image.asset(
                            'assets/images/Shop.png',
                            height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.035
                          : MediaQuery.of(context).size.height * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                   Opacity(
                    opacity: 0.7,
                    child: Text(
                      "store_name".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                    Text(
                     visitDetails != null ?    visitDetails!.shopName! : 'ميسر كو',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                   Opacity(
                    opacity: 0.7,
                    child: Text(
                      "vat_number".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                    Text(
                      visitDetails != null ?   visitDetails!.customerVatNumber : '6654654654513221',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                    Opacity(
                    opacity: 0.7,
                    child: Text(
                      "registration_number".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                    Text(
                      visitDetails != null ?    visitDetails!.customerRegistrationNumber! :    '45464654 654654',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                    Opacity(
                    opacity: 0.7,
                    child: Text(
                      "official_website".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                    Text(
                     visitDetails != null ? visitDetails!.customerWebsite :    'maisarco.com',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                   Opacity(
                    opacity: 0.7,
                    child: Text(
                      "documents".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
               SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:visitDetails == null ? 1 :  visitDetails!.images!.length ,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: FilesListViewItem(
                        image: visitDetails == null ?  '' : visitDetails!.images![index],
                      ),
                    );
                  }),
                  ),
                ],
              ),
            ),
    );
  }
}