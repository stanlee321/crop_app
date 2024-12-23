import 'package:flutter/material.dart';

class CropListSection extends StatelessWidget {
  const CropListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Crop List',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildListHeader(),
            const Divider(),
            _buildCropItem('Tomato', 'Solanum', 'Good', Colors.green),
            _buildCropItem('Lettuce', 'Lactuca', 'Fair', Colors.orange),
            _buildCropItem('Potato', 'Solanum', 'Good', Colors.green),
            _buildCropItem('Spinach', 'Spinacia', 'Poor', Colors.red),
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
              'Crop Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Species',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              'Health',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCropItem(String name, String species, String health, Color healthColor) {
    return InkWell(
      onTap: () {
        // Navigate to crop details
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
              child: Text(species),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: healthColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  health,
                  style: TextStyle(
                    color: healthColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
