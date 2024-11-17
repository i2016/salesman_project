import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:water/App/presentation/bloc/app_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/dialogs.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Inventory/data/models/inventory_transfer_request_response_model.dart';
import 'package:water/Inventory/presentation/bloc/inventory_transfer_request_bloc.dart';
import 'package:water/Visits/domain/entities/added_product_entity.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/pill_payment.dart';
import 'package:water/widgets/review_product_water_item.dart';
import 'package:water/widgets/search_text_field.dart';

class InventoryAddRequestConfirmScreenBody extends StatefulWidget {
  InventoryAddRequestConfirmScreenBody({super.key});

  @override
  State<InventoryAddRequestConfirmScreenBody> createState() => _InventoryAddRequestConfirmScreenBodyState();
}

class _InventoryAddRequestConfirmScreenBodyState extends State<InventoryAddRequestConfirmScreenBody> {
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocListener(
        bloc: inventoryTransferRequestBloc,
        listener: (context, state) {
      if(state is Loading){

        Shared.showLoadingDialog(context: context);
      }
      else if(state is TransferRequestDone){
        print("Done");
        InventoryTransferRequestResposneModel inventoryTransferRequestResposneModel =
        state.inventoryTransferRequestResposneModel as InventoryTransferRequestResposneModel;
        Shared.dismissDialog(context: context);
        Dialogs.showDialogSendRequest(context,
            inventoryTransferRequestResposneModel: inventoryTransferRequestResposneModel);
        Shared.order_products_list = [];

      }
      else if(state is TransferRequestErrorLoading){
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
    child:Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text(
                    'تفاصيل الطلب',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.014,
              ),
              Shared.order_products_list.length != 0 ?
              const ImageNumberProductPriceContainer() :Container(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                         appBloc.add(AppDrawrEvent(drawerType: 'editProduct'));
                 //     scaffoldKey!.currentState?.openEndDrawer();
                      },
                      child:  ReviewProductWaterItem(
                        addedProductEntity: filteredProducts[index],
                      ),
                    );
                  }),
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
                          'الاجمالي',
                          style: TextStyle(
                              color: Color(0xff0056C9),
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${Shared.calculateTotalForAllProducts()}  ر.س ',
                          style: TextStyle(
                              color: Color(0xff0056C9),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.003,
              ),
              const PillPayment(textButton: 'ارسال الطلب' , dialogName: 'transferRequest',)
            ],
          ),
        ),
      ),
      )  );
  }
}
