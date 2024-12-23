import 'package:flutter/material.dart';

class PestAlertsSection extends StatelessWidget {
  const PestAlertsSection({super.key});

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
              'Tomato (Aphids)',
              'Severe',
              Icons.warning,
              Colors.red,
              context,
            ),
            _buildAlertItem(
              'Potato (Whiteflies)',
              'Moderate',
              Icons.warning_amber,
              Colors.orange,
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertItem(
      String title, String severity, IconData icon, Color color, BuildContext context) {
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
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: severity),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
