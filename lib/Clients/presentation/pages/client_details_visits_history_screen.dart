import 'package:flutter/material.dart';
import 'package:water/App/presentation/pages/app_screen.dart';
import 'package:water/Clients/presentation/widgets/client_details_visits_history_screen_body.dart';

class ClientDetailsVisitsHistoryScreen extends StatelessWidget{
  const ClientDetailsVisitsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        child: ClientDetailsVisitsHistoryScreenBody(),
        screenButtons:[]
    );
  }
}