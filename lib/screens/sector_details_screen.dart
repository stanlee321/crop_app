import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../components/shared/location_picker.dart';

class SectorDetailsScreen extends StatelessWidget {
  final String sectorName;
  final String status;
  final String cropType;
  final double areaSize;
  final String soilType;
  final String irrigation;
  final LatLng location;

  const SectorDetailsScreen({
    super.key,
    required this.sectorName,
    required this.status,
    required this.cropType,
    required this.areaSize,
    required this.soilType,
    required this.irrigation,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$sectorName Details 📍'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Basic Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Name', sectorName),
                    _buildInfoRow('Status', status),
                    _buildInfoRow('Crop Type', cropType),
                    _buildInfoRow('Area Size', '$areaSize m²'),
                    _buildInfoRow('Soil Type', soilType),
                    _buildInfoRow('Irrigation', irrigation),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Recent Activities Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Activities',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildActivityItem(
                      '15-Dec',
                      'Fertilizer Applied',
                      Icons.science,
                      Colors.green,
                    ),
                    _buildActivityItem(
                      '12-Dec',
                      'Pest Detected',
                      Icons.bug_report,
                      Colors.red,
                    ),
                    _buildActivityItem(
                      '10-Dec',
                      'Crop Health Check',
                      Icons.health_and_safety,
                      Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Health Metrics Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Health Metrics',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildMetricItem('Soil Moisture', '75%', Colors.blue),
                    _buildMetricItem('Crop Health', 'Good', Colors.green),
                    _buildMetricItem('Pest Severity', 'Low', Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Location Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    LocationPicker(
                      initialLocation: location,
                      onLocationSelected: (location) {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to Edit Sector screen
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Sector'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to Add Task screen
                    },
                    icon: const Icon(Icons.add_task),
                    label: const Text('Add Task'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
      String date, String activity, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(
            date,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Text(activity),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
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
