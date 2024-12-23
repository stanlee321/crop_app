import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/reports/report_type_section.dart';
import '../components/reports/recent_reports_section.dart';
import '../components/reports/report_actions_section.dart';
import '../components/reports/summary_snapshot_section.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports and Analytics 📊'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              ReportTypeSection(),
              SizedBox(height: 16),
              RecentReportsSection(),
              SizedBox(height: 16),
              ReportActionsSection(),
              SizedBox(height: 16),
              SummarySnapshotSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
} 
