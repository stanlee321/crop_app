import 'package:flutter/material.dart';

class RecentActivitiesSection extends StatelessWidget {
  const RecentActivitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Activities',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildActivityItem(
              '15-Dec',
              'Fertilizer applied',
              'Sector 1',
              Icons.science,
              Colors.green,
            ),
            _buildActivityItem(
              '14-Dec',
              'Pest detected',
              'Sector 2',
              Icons.bug_report,
              Colors.red,
            ),
            _buildActivityItem(
              '12-Dec',
              'New crop added',
              'Tomato',
              Icons.add_circle,
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(
      String date, String activity, String location, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$activity ($location)',
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
