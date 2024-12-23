import 'package:flutter/material.dart';
import 'sector_performance_details_screen.dart';

class SectorsOverviewDetailsScreen extends StatelessWidget {
  const SectorsOverviewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sector Overview 📊'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Aggregate Statistics Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aggregate Statistics',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildStatItem('Total Sectors', '5', Icons.grid_view, Colors.blue),
                    _buildStatItem('Active Sectors', '4', Icons.check_circle, Colors.green),
                    _buildStatItem('Inactive Sectors', '1', Icons.cancel, Colors.red),
                    _buildStatItem('Avg Crop Health', 'Good', Icons.health_and_safety, Colors.orange),
                    _buildStatItem('Avg Soil Moisture', '70%', Icons.water_drop, Colors.blue),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Top Performing Sectors Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Top Performing Sectors',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildPerformanceItem('Sector 1', 'High Yield', Colors.green),
                    _buildPerformanceItem('Sector 3', 'Optimal Health', Colors.blue),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Alerts Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Alerts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildAlertItem('Sector 4: Low Moisture', Icons.warning_amber, Colors.orange),
                    _buildAlertItem('Sector 2: Pest Detected', Icons.bug_report, Colors.red),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color color) {
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

  Widget _buildPerformanceItem(String sector, String achievement, Color color) {
    return Builder(
      builder: (BuildContext context) => ListTile(
        leading: Icon(Icons.star, color: color),
        title: Text(sector),
        subtitle: Text(achievement),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SectorPerformanceDetailsScreen(
                sectorName: sector,
                performance: achievement,
                cropType: 'Tomato',
                areaSize: 100.0,
                status: 'Active',
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAlertItem(String message, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(message),
      dense: true,
    );
  }
} 
