import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:water/App/presentation/widgets/Drawer/inventory_edit_product_drawer.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Visits/data/models/create_order/create_order_response_model.dart';
import 'package:water/Visits/domain/entities/added_product_entity.dart';
import 'package:water/Visits/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/payment_method.dart';
import 'package:water/widgets/pill_payment.dart';
import 'package:water/widgets/review_product_water_item.dart';
import 'package:water/widgets/search_text_field_review_product.dart';
import 'package:water/widgets/take_photo_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ReviewProductScreenDetails extends StatefulWidget {
  ReviewProductScreenDetails({super.key});

  @override
  State<ReviewProductScreenDetails> createState() => _ReviewProductScreenDetailsState();
}

class _ReviewProductScreenDetailsState extends State<ReviewProductScreenDetails> {
  TextEditingController controller = new TextEditingController();
  List<AddedProductEntity> filteredProducts = Shared.order_products_list; // Assuming `Product` is the class used for products
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        filteredProducts = Shared.order_products_list
            .where((product) => product.name!.toLowerCase().contains(controller.text))
            .toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: createOrderBloc,
        listener: (context, state) {
      if(state is Loading){

        Shared.showLoadingDialog(context: context);
      }
      else if(state is CreateOrderDone){
        print("Done");
        CreateOrderResponseModel createOrderResponseModel = state.createOrderResponseModel as CreateOrderResponseModel;
        Shared.dismissDialog(context: context);
        Dialogs.showDialogcReateOrderResult(context,
        createOrderResponseModel: createOrderResponseModel);
        Shared.order_products_list = [];

      }
      else if(state is CreateOrderErrorLoading){
        print("ErrorLoading");
        print("state.message : ${state.message}");

        Shared.dismissDialog(context: context);
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "خطا ...",
          text: state.message,
        );

      }
    },
    child:Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: const InventoryEditProductDrawer(),
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
                            const Text(
                              'مراجعة المنتجات',
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
                        Shared.order_products_list.isEmpty ? Container() :   Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).orientation == Orientation.portrait ?
                            MediaQuery.of(context).size.height * 0.03
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

                                    hintText: 'البحث عن منتج',
                                    hintStyle: TextStyle(
                                      color: Color(0xff758195),
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
                    Shared.order_products_list.length != 0 ?
                    const ImageNumberProductPriceContainer() :Container(),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredProducts.length,
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
                                  label: 'حذف',
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                ),
                              ],
                            ),
                            child: ReviewProductWaterItem(
                              addedProductEntity: filteredProducts[index],

                            ),
                          );
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                     Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Text(
                            'الاجمالي',
                            style: TextStyle(
                                color: Color(0xff07326A),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${Shared.calculateTotalForAllProducts()}  ر.س ',
                              style: TextStyle(
                                  color: Color(0xff07326A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const PaymentMethod(),
                    const TakePhoto(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    const PillPayment(textButton: 'اصدار الفاتورة',),
                  ],
                ),
              ),
    ));
  }
}
