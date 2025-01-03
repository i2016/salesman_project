import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Inventory/presentation/bloc/inventory_transfer_request_bloc.dart';
import 'package:water/index.dart';

import '../Base/Shimmer/loading_shimmer.dart';

class ProductsAndPricesInventoryAddRequestScreen extends StatefulWidget {
  bool? inventoryCategory ;
   ProductsAndPricesInventoryAddRequestScreen({super.key,this.inventoryCategory = false});

  @override
  State<ProductsAndPricesInventoryAddRequestScreen> createState() => _ProductsAndPricesInventoryAddRequestScreenState();
}

class _ProductsAndPricesInventoryAddRequestScreenState extends State<ProductsAndPricesInventoryAddRequestScreen> {
  @override
  void initState() {
    super.initState();
    inventoryTransferRequestBloc.add(SalesRemainingLimitEvent());
  }
  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      BlocBuilder<InventoryTransferRequestBloc, AppState>(
        bloc: inventoryTransferRequestBloc,
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingPlaceHolder(
              shimmerType: ShimmerType.list,
              cellShimmerHeight: 50,
              shimmerCount: 10,
            );
          }
          else if (state is SalesRemainingLimitDone) {
            if(state.salesRemainingLimitModel!.result!.data != null){
              Shared.remainingLimit = state.salesRemainingLimitModel!.result!.data!.remainingLimit!;
              return  Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8
                    ),
                    width: MediaQuery.of(context).size.width * 0.245,
                    height: MediaQuery.of(context).orientation == Orientation.portrait ?
                    MediaQuery.of(context).size.height * 0.075
                        : MediaQuery.of(context).size.height * 0.316,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/asssa.png',
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                         Text(
                         "remaining_balance".tr(),
                          style: TextStyle(
                            color: Color(0xff0056C9),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          '${state.salesRemainingLimitModel!.result!.data!.remainingLimit!.toStringAsFixed(2)}  ${"sar".tr()}  ',
                          style: TextStyle(
                            color: Color(0xff0056C9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.016,
                  ),
                ],
              );
            }
            else{
              return Container();
            }

          } else if (state is GetTodayVisitsErrorLoading) {
            return Center(
              child: Text("${state.message}"),
            );
          } else {
            return Container();
          }

        },
      ),
      widget.inventoryCategory! ?  Container() :  Opacity(
        opacity: Shared.remainingLimit >= Shared.calculateTotalForAllProducts() ?1 : 0.5,
        child: InkWell(
          onTap:    /*Shared.remainingLimit >= Shared.calculateTotalForAllProducts() ? */ () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const InventoryAddRequestConfirmScreen()));
          } /*: null*/,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.23,
            height: MediaQuery.of(context).orientation == Orientation.portrait ?
            MediaQuery.of(context).size.height * 0.041
                : MediaQuery.of(context).size.height * 0.074,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/CheckCircle.png',
                      color: Colors.blue),
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
        ),
      ) ,
    ],
  );

  }
}
