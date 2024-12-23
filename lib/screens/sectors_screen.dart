import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/sectors/sectors_overview_section.dart';
import '../components/sectors/sectors_list_section.dart';
import '../components/sectors/sectors_actions_section.dart';
import '../components/sectors/sectors_alerts_section.dart';

class SectorsScreen extends StatelessWidget {
  const SectorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sectors 📍'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              SectorsOverviewSection(),
              SizedBox(height: 16),
              SectorsListSection(),
              SizedBox(height: 16),
              SectorsActionsSection(),
              SizedBox(height: 16),
              SectorsAlertsSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
} 
