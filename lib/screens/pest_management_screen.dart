import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/pest_management/pest_filters_section.dart';
import '../components/pest_management/pest_list_section.dart';
import '../components/pest_management/pest_actions_section.dart';
import '../components/pest_management/pest_alerts_section.dart';

class PestManagementScreen extends StatelessWidget {
  const PestManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest Management 🐛'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              PestFiltersSection(),
              SizedBox(height: 16),
              PestListSection(),
              SizedBox(height: 16),
              PestActionsSection(),
              SizedBox(height: 16),
              PestAlertsSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
} 
