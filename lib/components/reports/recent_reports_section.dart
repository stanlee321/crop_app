import 'package:flutter/material.dart';

class RecentReportsSection extends StatelessWidget {
  const RecentReportsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Reports',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildReportItem(
              'Crop Health Report',
              '15-Dec',
              Icons.local_florist,
              Colors.green,
            ),
            _buildReportItem(
              'Cost Analysis',
              '10-Dec',
              Icons.attach_money,
              Colors.blue,
            ),
            _buildReportItem(
              'Yield Trends',
              '05-Dec',
              Icons.trending_up,
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportItem(String title, String date, IconData icon, Color color) {
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
                  title,
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
