import 'package:flutter/material.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/Base/Helper/app_event.dart';
import 'package:water/Visits/data/models/visits_history_model.dart';
import 'package:water/Visits/presentation/bloc/visits/visits_bloc.dart';
import 'package:water/widgets/visit_history_details_screen_body.dart';

class VisitHistoryDetailsScreen extends StatefulWidget{
  VisitHistory? visitHistory;
   VisitHistoryDetailsScreen({super.key,this.visitHistory});

  @override
  State<VisitHistoryDetailsScreen> createState() => _VisitHistoryDetailsScreenState();
}

class _VisitHistoryDetailsScreenState extends State<VisitHistoryDetailsScreen> {

  @override
  void initState() {
    visitsBloc.add(GetVisitDetailsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return AppScreen(
      child: VisitHistoryDetailsScreenBody(
        visitHistory: widget.visitHistory,
      ),
     visitDetails: true,
    );
  }
}