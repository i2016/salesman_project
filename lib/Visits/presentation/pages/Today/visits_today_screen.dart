
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
import 'package:water/Visits/data/models/visits_model.dart';
import 'package:water/Visits/presentation/bloc/visits/visits_bloc.dart';
import 'package:water/Visits/presentation/pages/History/visits_history_screen.dart';
import 'package:water/Visits/presentation/pages/Today/add_visit_registered_clients_screen.dart';
import '../../../../App/presentation/pages/app_screen.dart';
import '../../../../App/presentation/widgets/app_home_button_widget.dart';


class VisitsTodayScreen extends StatelessWidget {
  final String customerName;

  VisitsTodayScreen({Key? key, this.customerName = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: _Page(customerName: customerName),
      screenButtons: [
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
      ],
    );
  }
}

class _Page extends StatefulWidget {
  final String customerName;

  _Page({Key? key, this.customerName = ""}) : super(key: key);

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  final TextEditingController _searchController = TextEditingController();
  List<Visit> _filteredVisits = [];
  List<Visit> _allVisits = [];
  bool _isFilteringDone = false;

  @override
  void initState() {
    super.initState();
    visitsBloc.add(GetTodayVisitsEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterVisitsFunc(String query) {
    print("query : $query");
    Future.microtask(() {
      setState(() {
        if (query.isEmpty) {
          _filteredVisits = _allVisits; // Reset to show all visits when search is cleared
        } else {
          _filteredVisits = _allVisits
              .where((visit) =>
          visit.visitName.toLowerCase().contains(query.toLowerCase()) ||
              visit.customerName.toLowerCase().contains(query.toLowerCase()))
              .toList();

        }
        _isFilteringDone = true; // Mark filtering as complete
      });
    });
  }

  Widget _buildVisitsList(AppState state) {
    if (state is Loading) {
      return const LoadingPlaceHolder(
        shimmerType: ShimmerType.list,
        cellShimmerHeight: 50,
        shimmerCount: 10,
      );
    } else if (state is GeTodayVisitsDone) {
      _allVisits = state.visits ?? [];

      // Initial filtering based on customerName
      if (!_isFilteringDone && widget.customerName.isNotEmpty) {
        _filterVisitsFunc(widget.customerName);
      }

      final displayVisits =
      _isFilteringDone  ? _filteredVisits : _allVisits;

      if (displayVisits.isNotEmpty) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: displayVisits.length,
          itemBuilder: (context, index) {
            return RegisteredCustomersScreenContainerItem(
              storeName: displayVisits[index].visitName,
              sales: '${"Monthly_sales".tr()}30,000 ',
              distance: "Far_away".tr() + "232" + "km".tr(),
              money: '15,000 ${"debt".tr()}',
              visit: displayVisits[index],
            );
          },
        );
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: Shared.width * 0.3),
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
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        body: Column(
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
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.033,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.5),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterVisitsFunc,
                  cursorColor: const Color.fromARGB(255, 66, 64, 64),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    prefixIcon: Image.asset(
                      'assets/images/search.png',
                      color: Colors.black,
                    ),
                    hintText: "search_for_visit".tr(),
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 146, 155, 171),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: BlocBuilder<VisitsBloc, AppState>(
                bloc: visitsBloc,
                builder: (context, state) => _buildVisitsList(state),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
