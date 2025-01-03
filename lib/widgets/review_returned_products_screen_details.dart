import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Returns/data/models/create_returns_model.dart';
import 'package:water/Returns/domain/entities/returns_product_entity.dart';
import 'package:water/Returns/presentation/bloc/create_returnsbloc.dart';
import 'package:water/Visits/data/models/product_model.dart';
import 'package:water/widgets/image_number_product_price_container_review_returned_products.dart';
import 'package:water/widgets/pill_payment_review_returned_products.dart';
import 'package:water/widgets/review_returned_products_water_item.dart';

class ReviewReturnedProductsScreenDetails extends StatefulWidget {
  ReviewReturnedProductsScreenDetails({super.key});

  @override
  State<ReviewReturnedProductsScreenDetails> createState() => _ReviewReturnedProductsScreenDetailsState();
}

class _ReviewReturnedProductsScreenDetailsState extends State<ReviewReturnedProductsScreenDetails> {
  TextEditingController controller = new TextEditingController();
  List<ReturnsProductEntity> filteredProducts = Shared.returns_products_list; // Assuming `Product` is the class used for products
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        filteredProducts = Shared.returns_products_list
            .where((product) => product.name!.toLowerCase().contains(controller.text))
            .toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: createReturnsBloc,
        listener: (context, state) {
          if(state is Loading){

            Shared.showLoadingDialog(context: context);
          }
          else if(state is CreateReturnsDone){
            CreateReturnsModel createReturnsModel = state.createReturnsModel as CreateReturnsModel;
            Shared.dismissDialog(context: context);
            Shared.returns_products_list = [];
            Dialogs.showDialogReviewReturnedProducts(context,
            createReturnsModel: createReturnsModel);
          }
          else if(state is CreateReturnsErrorLoading){

            Shared.dismissDialog(context: context);
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: "error".tr(),
              text: state.message,
            );

          }
        },
        child:Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.arrow_back)
                            ),
                             Text(
                               "Returned_Products_Review".tr(),
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.019,
                        ),
                        Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).orientation == Orientation.portrait ?
                            MediaQuery.of(context).size.height * 0.033
                                : MediaQuery.of(context).size.height * 0.052,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child:  Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1.5),
                              child: TextField(
                                controller: controller,
                                cursorColor: Color.fromARGB(255, 66, 64, 64),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    border: InputBorder.none,
                                    prefixIcon: Image.asset(
                                      'assets/images/search.png',
                                      color: Colors.black,
                                    ),

                                    hintText: "search_product".tr(),
                                    hintStyle: const TextStyle(
                                      color: Color.fromARGB(255, 165, 171, 182),
                                    )
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    const ImageNumberProductPriceContainerReviewReturnedProducts(),
                    Flexible(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:  filteredProducts.length,
                          itemBuilder: (context, index) {
                           return Slidable(
                              key: ValueKey(filteredProducts[index]),
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      setState(() {
                                        filteredProducts.removeAt(index);
                                      });
                                    },
                                    label: "delete".tr(),
                                    icon: Icons.delete,
                                    backgroundColor: Colors.red,
                                  ),
                                ],
                              ),
                              child:  ReviewReturnedProductsWaterItem(
                                returnsProductEntity: filteredProducts[index],
                              )
                            );
                      
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.03
                          : MediaQuery.of(context).size.height * 0.05,
                      decoration: const BoxDecoration(
                          color: Color(0xffEBF7FC),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(11),
                              bottomLeft: Radius.circular(11))),
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Text(
                                "total".tr(),
                                style: TextStyle(
                                    color: Color(0xff0056C9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${Shared.calculateReturnsTotalForAllProducts()}    ${"sar".tr()}   ',
                                  style: TextStyle(
                                      color: Color(0xff0056C9),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const PillPaymentReviewReturnedProducts(),
                  ],
                ),
              ),
    ));
  }
}
