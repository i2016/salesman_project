import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/bloc/app_bloc.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Inventory/presentation/bloc/inventory_transfer_request_bloc.dart';
import 'package:water/Inventory/presentation/pages/current_requests/current_requests_details_widget.dart';
import 'package:water/Inventory/presentation/pages/current_requests/current_requests_screen.dart';
import 'package:water/widgets/image_number_product_price_container_Widget.dart';
import 'package:water/widgets/pill_payment.dart';
import 'package:water/widgets/review_product_water_item.dart';
import 'package:water/widgets/search_text_field.dart';

class InventoryCurrentRequestDetailsScreenBody extends StatefulWidget {
  InventoryCurrentRequestDetailsScreenBody({super.key});

  @override
  State<InventoryCurrentRequestDetailsScreenBody> createState() =>
      _InventoryCurrentRequestDetailsScreenBodyState();
}

class _InventoryCurrentRequestDetailsScreenBodyState
    extends State<InventoryCurrentRequestDetailsScreenBody> {
  @override
  void initState() {
    super.initState();
    inventoryTransferRequestBloc.add(GetTransferRequestsDetailsEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      customAnimatedPushNavigation(context, CurrentRequestsScreen());
                    },
                    child: const Icon(Icons.arrow_back)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.008,
                ),
                 Text(
                 "request_details".tr(),
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
                else if (state is GetTransferRequestsDetailsDone) {
                  if(state.transferRequestsDetails != null ){

                    return  CurrentRequestsDetailsWidget(
                      transferRequestsDetails: state.transferRequestsDetails,
                    );
                  }
                  else{
                    return Center(
                      child: Text("no_details".tr()),
                    );
                  }

                } else if (state is GetTransferRequestsDetailsErrorLoading) {
                  return Center(
                    child: Text("${state.message}"),
                  );
                } else {
                  return Container();
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}
