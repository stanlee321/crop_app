import 'package:flutter/material.dart';

class SummarySnapshotSection extends StatelessWidget {
  const SummarySnapshotSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Summary Snapshot',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildSnapshotItem(
              'Avg Crop Health',
              'Good',
              Icons.favorite,
              Colors.green,
            ),
            _buildSnapshotItem(
              'Total Costs',
              '\$500',
              Icons.attach_money,
              Colors.blue,
            ),
            _buildSnapshotItem(
              'Total Yield',
              '1000kg',
              Icons.trending_up,
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSnapshotItem(String label, String value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(label),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
