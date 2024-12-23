import 'package:flutter/material.dart';

class InventoryOverviewSection extends StatelessWidget {
  const InventoryOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildOverviewItem(Icons.inventory, 'Total Items:', '10'),
            const SizedBox(height: 8),
            _buildOverviewItem(Icons.warning, 'Low Stock Alerts:', '2'),
            const SizedBox(height: 8),
            _buildOverviewItem(Icons.shopping_cart, 'Recent Purchases:', '3'),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewItem(IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
} 
