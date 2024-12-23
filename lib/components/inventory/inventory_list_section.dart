import 'package:flutter/material.dart';

class InventoryListSection extends StatelessWidget {
  const InventoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Inventory List',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildListHeader(),
            const Divider(),
            _buildInventoryItem('Urea', 'Fertilizer', '50kg', Colors.green),
            _buildInventoryItem('Organic Comp', 'Fertilizer', '20kg', Colors.green),
            _buildInventoryItem('Pesticide A', 'Chemical', '5L', Colors.orange),
            _buildInventoryItem('Gloves', 'Tools', '30', Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildListHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Item Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              'Stock',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryItem(String name, String type, String stock, Color typeColor) {
    return InkWell(
      onTap: () {
        // Navigate to inventory item details
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(name),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: typeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    color: typeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(stock),
            ),
          ],
        ),
      ),
    );
  }
} 
