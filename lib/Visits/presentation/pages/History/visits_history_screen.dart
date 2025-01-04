import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Base/Helper/app_state.dart';
import 'package:water/Base/Shimmer/loading_shimmer.dart';
import 'package:water/Base/common/navigtor.dart';
import 'package:water/Base/common/shared.dart';
import 'package:water/Base/common/shared_preference_manger.dart';
import 'package:water/Visits/presentation/bloc/visits/visits_bloc.dart';
import 'package:water/Visits/presentation/pages/History/visit_history_details_screen.dart';
import 'package:water/widgets/visits_history_screen_container_item.dart';

class VisitsHistoryScreen extends StatelessWidget{
  const VisitsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: _page(),
      screenButtons: [],
    );
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
    visitsBloc.add(GetVisitsHistoryEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
       textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr,

      child: Scaffold(
        drawer: const Drawer(),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.012,
              ),
               Text(
                 "visit_history".tr(),
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
       /*     Padding(padding: EdgeInsets.symmetric(vertical: 10),
            child: const VisitTypeContainers(
              textFirstContainer: 'نوع الزيارة',
              textSecondContainer: 'من',
              textThirdContainer: 'الى',
            ),
            ),*/

            BlocBuilder<VisitsBloc, AppState>(
              bloc: visitsBloc,
              builder: (context, state) {
                if (state is Loading) {
                  return const LoadingPlaceHolder(
                    shimmerType: ShimmerType.list,
                    cellShimmerHeight: 50,
                    shimmerCount: 10,
                  );
                }
                else if (state is GetVisitsHistoryDone) {
                  if(state.visitsHistory != null && state.visitsHistory!.isNotEmpty){
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                            ? 2
                            : 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                            ? 5.1 / 2
                            : 4.5 / 2,
                      ),
                      itemCount: state.visitsHistory?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            sharedPreferenceManager.writeData(CachingKey.VISIT_ID,  state.visitsHistory![index].visitId.toString());

                            customAnimatedPushNavigation(context, VisitHistoryDetailsScreen(
                              visitHistory: state.visitsHistory![index],
                            ));
                          },
                          child:  VisitsHistoryScreenContainerItem(
                            date: state.visitsHistory![index].visitDate!,
                            collect: state.visitsHistory![index].totalAmountDue!.toStringAsFixed(2),
                            complete: '30,000',
                            visit: "in_todays_visits".tr(),
                            returned: '30,000',
                            store: state.visitsHistory![index].visitName!,
                            icon: 'assets/images/trueeStyle.png',
                            iconColor: Color(0xff0056C9),
                            iconProductType: 'assets/images/datee.png',
                            iconStoreName: 'assets/images/smallShop.png',
                            iconCompleted: 'assets/images/trueInSquare.png',
                            iconReturned: 'assets/images/RestartCircle.png',
                            iconCollected: 'assets/images/MoneyBag.png',
                            collectedColor: Color(0xff1D6E4F),
                          ),
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

                }
                else if (state is GetVisitsHistoryErrorLoading) {
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
