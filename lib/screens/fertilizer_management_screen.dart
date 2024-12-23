import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/fertilizer_management/fertilizer_filters_section.dart';
import '../components/fertilizer_management/fertilizer_list_section.dart';
import '../components/fertilizer_management/fertilizer_actions_section.dart';
import '../components/fertilizer_management/fertilizer_alerts_section.dart';

class FertilizerManagementScreen extends StatelessWidget {
  const FertilizerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fertilizer Management 💧'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              FertilizerFiltersSection(),
              SizedBox(height: 16),
              FertilizerListSection(),
              SizedBox(height: 16),
              FertilizerActionsSection(),
              SizedBox(height: 16),
              FertilizerAlertsSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
} 
