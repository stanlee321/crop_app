import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../components/my_drawer.dart';
import '../components/sectors/sectors_overview_section.dart';
import '../components/sectors/sectors_list_section.dart';
import '../components/sectors/sectors_actions_section.dart';
import '../components/sectors/sectors_alerts_section.dart';
import 'sector_details_screen.dart';
import 'sectors_overview_details_screen.dart';
import 'sectors_map_screen.dart';

class SectorsScreen extends StatelessWidget {
  const SectorsScreen({super.key});

  void _navigateToSectorDetails(BuildContext context, Map<String, dynamic> sector) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SectorDetailsScreen(
          sectorName: sector['name'],
          status: sector['status'],
          cropType: sector['cropType'],
          areaSize: sector['areaSize'],
          soilType: sector['soilType'],
          irrigation: sector['irrigation'],
          location: sector['location'],
        ),
      ),
    );
  }

  void _navigateToOverviewDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SectorsOverviewDetailsScreen(),
      ),
    );
  }

  void _navigateToMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SectorsMapScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sample data - In a real app, this would come from a database or API
    final List<Map<String, dynamic>> sectors = [
      {
        'name': 'Sector 1',
        'status': 'Active',
        'cropType': 'Tomato',
        'areaSize': 100.0,
        'soilType': 'Loamy',
        'irrigation': 'Drip',
        'location': const LatLng(-17.3938, -66.2479),
      },
      {
        'name': 'Sector 2',
        'status': 'Active',
        'cropType': 'Potato',
        'areaSize': 150.0,
        'soilType': 'Clay',
        'irrigation': 'Sprinkler',
        'location': const LatLng(-17.3940, -66.2480),
      },
      // Add more sample sectors as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sectors 📍'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SectorsOverviewSection(),
            const SizedBox(height: 16),
            // Updated SectorsListSection with onTap handler
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sectors List',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: sectors.length,
                      itemBuilder: (context, index) {
                        final sector = sectors[index];
                        return ListTile(
                          title: Text(sector['name']),
                          subtitle: Text(sector['cropType']),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: sector['status'] == 'Active'
                                  ? Colors.green.withOpacity(0.1)
                                  : Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              sector['status'],
                              style: TextStyle(
                                color: sector['status'] == 'Active'
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () => _navigateToSectorDetails(context, sector),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Updated Actions section with navigation
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Actions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _navigateToOverviewDetails(context),
                            icon: const Icon(Icons.visibility),
                            label: const Text('View Details'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _navigateToMap(context),
                            icon: const Icon(Icons.map),
                            label: const Text('View on Map'),
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
            ),
            const SizedBox(height: 16),
            const SectorsAlertsSection(),
          ],
        ),
      ),
    );
  }
} 
