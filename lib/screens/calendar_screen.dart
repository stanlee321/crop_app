import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/calendar/calendar_view_mode_section.dart';
import '../components/calendar/calendar_grid_section.dart';
import '../components/calendar/calendar_tasks_section.dart';
import '../components/calendar/calendar_actions_section.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar 📅'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              CalendarViewModeSection(),
              SizedBox(height: 16),
              CalendarGridSection(),
              SizedBox(height: 16),
              CalendarTasksSection(),
              SizedBox(height: 16),
              CalendarActionsSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
} 
