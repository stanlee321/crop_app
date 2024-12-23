import 'package:flutter/material.dart';

class FertilizerAlertsSection extends StatelessWidget {
  const FertilizerAlertsSection({super.key});

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
              'Urea application delayed',
              Icons.warning_amber,
              Colors.orange,
              context,
            ),
            _buildAlertItem(
              'Low stock: Organic Compost',
              Icons.inventory,
              Colors.red,
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertItem(
      String message, IconData icon, Color color, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
} 
