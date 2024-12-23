import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SectorPerformanceDetailsScreen extends StatelessWidget {
  final String sectorName;
  final String performance;
  final String cropType;
  final double areaSize;
  final String status;

  const SectorPerformanceDetailsScreen({
    super.key,
    required this.sectorName,
    required this.performance,
    required this.cropType,
    required this.areaSize,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sector Performance 📊'),
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
                    _buildInfoRow('Sector Name', sectorName),
                    _buildInfoRow('Performance', performance),
                    _buildInfoRow('Crop Type', cropType),
                    _buildInfoRow('Area Size', '$areaSize m²'),
                    _buildInfoRow('Status', status),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Key Metrics Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Key Metrics',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildMetricItem('Avg Crop Health', 'Good', Colors.green),
                    _buildMetricItem('Avg Soil Moisture', '75%', Colors.blue),
                    _buildMetricItem('Pest Incidents', '1', Colors.orange),
                    _buildMetricItem('Fertilizer Used', '50 kg', Colors.purple),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Historical Performance Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Historical Performance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    const Text('Crop Health Over Time'),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        _cropHealthData(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Yield Over Time'),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        _yieldData(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Performance Insights Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Performance Insights',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildInsightItem(
                      'Effective irrigation system',
                      Icons.water_drop,
                      Colors.blue,
                    ),
                    _buildInsightItem(
                      'Timely pest control actions',
                      Icons.bug_report,
                      Colors.green,
                    ),
                    _buildInsightItem(
                      'Optimal fertilizer usage',
                      Icons.science,
                      Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // PDF export logic will go here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Exporting PDF report...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Export PDF Report'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                minimumSize: const Size(double.infinity, 0),
              ),
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

  Widget _buildInsightItem(String insight, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(insight),
      dense: true,
    );
  }

  LineChartData _cropHealthData() {
    return LineChartData(
      gridData: const FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 0:
                  return const Text('Jan 1');
                case 1:
                  return const Text('Jan 15');
                case 2:
                  return const Text('Feb 1');
                case 3:
                  return const Text('Feb 15');
                case 4:
                  return const Text('Mar 1');
                default:
                  return const Text('');
              }
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(value.toInt().toString());
            },
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 75),
            FlSpot(1, 78),
            FlSpot(2, 82),
            FlSpot(3, 80),
            FlSpot(4, 85),
          ],
          isCurved: true,
          color: Colors.green,
          barWidth: 3,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.green.withOpacity(0.1),
          ),
        ),
      ],
    );
  }

  LineChartData _yieldData() {
    return LineChartData(
      gridData: const FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 0:
                  return const Text('Jan 1');
                case 1:
                  return const Text('Jan 15');
                case 2:
                  return const Text('Feb 1');
                case 3:
                  return const Text('Feb 15');
                case 4:
                  return const Text('Mar 1');
                default:
                  return const Text('');
              }
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(value.toInt().toString());
            },
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 50),
            FlSpot(1, 65),
            FlSpot(2, 75),
            FlSpot(3, 85),
            FlSpot(4, 90),
          ],
          isCurved: true,
          color: Colors.blue,
          barWidth: 3,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.blue.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
} 
