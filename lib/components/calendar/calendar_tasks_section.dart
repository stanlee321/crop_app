import 'package:flutter/material.dart';

class CalendarTasksSection extends StatelessWidget {
  const CalendarTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tasks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildTaskItem(
              '15-Dec',
              'Fertilizer Application (Urea)',
              Icons.science,
              Colors.green,
            ),
            _buildTaskItem(
              '18-Dec',
              'Pest Inspection (Sector 2)',
              Icons.bug_report,
              Colors.orange,
            ),
            _buildTaskItem(
              '20-Dec',
              'Irrigation Maintenance',
              Icons.water_drop,
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(String date, String task, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 
