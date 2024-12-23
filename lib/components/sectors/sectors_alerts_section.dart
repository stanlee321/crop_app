import 'package:flutter/material.dart';

class SectorsAlertsSection extends StatelessWidget {
  const SectorsAlertsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alerts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildAlertItem(
              'Sector 4',
              'Low soil moisture',
              Icons.water_drop,
              Colors.orange,
              context,
            ),
            _buildAlertItem(
              'Sector 1',
              'Pest detected',
              Icons.bug_report,
              Colors.red,
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertItem(
      String sector, String message, IconData icon, Color color, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: '$sector: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: message),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
