import 'package:flutter/material.dart';

class CalendarViewModeSection extends StatelessWidget {
  const CalendarViewModeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'View Mode',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: _buildViewModeButton('Day', Icons.view_day),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildViewModeButton('Week', Icons.view_week),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildViewModeButton('Month', Icons.calendar_view_month),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewModeButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
} 
