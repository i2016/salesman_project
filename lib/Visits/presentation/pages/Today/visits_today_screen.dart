import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/theme.dart';
import 'package:water/Clients/presentation/widgets/registered_customers_screen_container_item.dart';
import 'package:water/Visits/presentation/bloc/visits/visits_bloc.dart';
import 'package:water/Visits/presentation/pages/History/visits_history_screen.dart';
import 'package:water/Visits/presentation/pages/Today/add_visit_registered_clients_screen.dart';
import '../../../../App/presentation/pages/app_screen.dart';
import '../../../../App/presentation/widgets/app_home_button_widget.dart';

class VisitsTodayScreen extends StatelessWidget {
  const VisitsTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(child: _page(), screenButtons: [
      AppButtonWidget(
        asset: 'assets/images/add.png',
        text: "add_visit".tr(),
        onClick: () {
          customAnimatedPushNavigation(
              context, AddVisitRegisteredClientsScreen());
        },
      ),
      AppButtonWidget(
        asset: 'assets/images/timeHistory.png',
        text: "visit_history".tr(),
        onClick: () {
          customAnimatedPushNavigation(context, VisitsHistoryScreen());
          },
        color: kWhiteColor,
      ),
    ]);
  }
}

class _page extends StatefulWidget {
  _page({super.key});

  @override
  State<_page> createState() => _pageState();
}

class _pageState extends State<_page> {
  @override
  void initState() {
    visitsBloc.add(GetTodayVisitsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        body:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "today_visits".tr(),
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.008,
              ),
              Expanded(child: BlocBuilder<VisitsBloc, AppState>(
                bloc: visitsBloc,
                builder: (context, state) {
                  if (state is Loading) {
                    return const LoadingPlaceHolder(
                      shimmerType: ShimmerType.list,
                      cellShimmerHeight: 50,
                      shimmerCount: 10,
                    );
                  }
                  else if (state is GeTodayVisitsDone) {
                    if(state.visits != null && state.visits!.isNotEmpty){
                      return ListView.builder(
                     //   physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        /*   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait ? 2 : 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: MediaQuery.of(context).orientation ==
                              Orientation.portrait ? 5.1 / 2 : 4.5 / 2,
                        ),*/
                        itemCount: state.visits?.length,
                        itemBuilder: (context, index) {
                          return  RegisteredCustomersScreenContainerItem(
                            storeName: "store_name".tr(),
                            sales: '${"Monthly_sales".tr()}30,000 ' ,
                            distance: "Far_away".tr() + "232" + "km".tr(),
                            money: '15,000 ${"debt".tr()}',

                            visit:  state.visits![index],
                          );
                        },
                      );
                    }
                    else{
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical:Shared.width * 0.3),
                        child: Center(
                          child: Text("no_visits".tr()),
                        ),
                      );
                    }

                  } else if (state is GetTodayVisitsErrorLoading) {
                    return Center(
                      child: Text("${state.message}"),
                    );
                  } else {
                    return Container();
                  }

                },
              ))
            ],

        ),
      ),
    );
  }
}
