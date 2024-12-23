import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SectorsMapScreen extends StatelessWidget {
  const SectorsMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample sectors data with locations
    final List<Map<String, dynamic>> sectors = [
      {
        'name': 'Sector 1',
        'status': 'Active',
        'cropType': 'Tomato',
        'health': 'Good',
        'location': const LatLng(-17.3938, -66.2479),
      },
      {
        'name': 'Sector 2',
        'status': 'Inactive',
        'cropType': 'Potato',
        'health': 'Poor',
        'location': const LatLng(-17.3940, -66.2480),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sectors Map 🗺️'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: const LatLng(-17.3939, -66.2479),
                initialZoom: 15.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: sectors.map((sector) {
                    return Marker(
                      point: sector['location'],
                      width: 80,
                      height: 80,
                      child: GestureDetector(
                        onTap: () {
                          _showSectorInfo(context, sector);
                        },
                        child: Icon(
                          Icons.location_pin,
                          color: sector['status'] == 'Active'
                              ? Colors.green
                              : Colors.red,
                          size: 40,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSectorInfo(BuildContext context, Map<String, dynamic> sector) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(sector['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Status', sector['status']),
            _buildInfoRow('Crop Type', sector['cropType']),
            _buildInfoRow('Health', sector['health']),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to sector details
            },
            child: const Text('View Details'),
          ),
        ],
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
            '$label:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
} 
